
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/video.dart';
class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableVideo = 'VideoTable';
  final String columnId = 'id';
  final String image = 'image';
  final String url = 'url';
  final String duration = 'duration';
  final String title = 'title';
  final String favoriteStatus = 'favorite_status';

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'flashgo.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableVideo($columnId INTEGER PRIMARY KEY, $image TEXT, $url TEXT, $duration INTEGER, $title TEXT, $favoriteStatus TEXT)');
  }

  Future<int> insertVideo(Video video) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableVideo, video.toJson());

    return result;
  }

  Future<List> selectVideos({int limit, int offset}) async {
    var dbClient = await db;
    var result = await dbClient.query(
      tableVideo,
      columns: [columnId, image, url, duration, title, favoriteStatus],
      limit: limit,
      offset: offset,
    );
    List<Video> videos = [];
    result.forEach((item) => videos.add(Video.fromSql(item)));
    return videos;
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableVideo'));
  }

  Future<Video> getVideo(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableVideo,
        columns: [columnId, image, url, duration, title, favoriteStatus],
        where: '$id = ?',
        whereArgs: [id]);

    if (result.length > 0) {
      return Video.fromSql(result.first);
    }

    return null;
  }

  Future<int> deleteNote(String images) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableVideo, where: '$image = ?', whereArgs: [images]);
  }

  Future<int> updateNote(Video video) async {
    var dbClient = await db;
    return await dbClient.update(tableVideo, video.toJson(),
        where: "$columnId = ?", whereArgs: [video.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}