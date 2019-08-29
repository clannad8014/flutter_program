import 'package:path/path.dart' as path;
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
//解析html
// import '../res/dom.dart';
// import '../res/parser.dart';
// import '../res/dom_parsing.dart';

// import 'package:http/http.dart' as http;
// import 'package:/parser.dart' show parse;
// import 'package:/dom.dart';
//1566284984
class tools{
   //##################   文件读写 ################################
  getLocalPath ()async{//获取本地路径
      try {
            var tempDir = await getTemporaryDirectory();
            String tempPath = tempDir.path;

            var appDocDir = await getApplicationDocumentsDirectory();
            String appDocPath = appDocDir.path;

            // print('临时目录: ' + tempPath);
            print('文档目录: ' + appDocPath);
            return appDocDir.path;
        }
        catch(err) {
            print(" ######### 读取目录错误 ########### "+err.toString());
            return "none";
        }

  }
  
     createPath (String path)async{//创建目录文件
      // File(path).create(recursive: true);
        File(path).create(recursive: true).then(
          (val){
            print(" ==  "+val.path);
          }
          
        );
   }
   Future pathBool(String path) async{
      File fileQuestions=File(path);    
      var flag=await fileQuestions.exists();
      print(" pathBool:"+flag.toString());
      return flag;
   }

    writeJson(String path,obj) async{//写入json
        try {
          print("正在写入文件。。。。。。。。。");
            File file=new File(path);
            return file.writeAsString(json.encode(obj));
        }
        catch (err) {
            print(err);
        }
    }
      readJson(path) async {//读取json
        try {
            File file=new File(path);
            String str = await file.readAsString();
            print("+++++  ${path}  ");
            print(str);
            return json.decode(str);
        }
        catch (err) {
            print(err);
        }
    }
//     Future _loadUserInfo() async{
//   print("_loadUserInfo:${new DateTime.now()}");
//   print(await _getUserInfo());
//   print("_loadUserInfo:${new DateTime.now()}");
// }
     readJsonData(String examId,String type,String name) async{//读取按title
             try {
          print("正在读入文件。。。。。。。。。");
           String localPath= await getLocalPath();
           String path="${localPath}/temp/${examId}/${type}/${name}.json";
          var str=await readJson(path);
          return str; 
        } 
        catch (err) {
            print(err);
            return err;
        }
     }

//*********  测试  *********** */
    readJson1(String examId,String type,String name) async{//读取按title
        try {
           
            //  getLocalPath() //获取本地目录
            // .then((localPath) async{
            //   String path="${localPath}/temp/${examId}/${type}/${name}.json";
            //       File file=new File(path);
            //       String str = await file.readAsString();
            //       print("+++++  ${path}  ");
            //       print(str);
            //       res=await json.decode(str);
            //          return json.decode(str);
            // });
           String localPath= await getLocalPath();
           String path="${localPath}/temp/${examId}/${type}/${name}.json";
          //  File file=new File(path);
          //   String str = await file.readAsString();
          //   print("+++++  ${path}  ");
          //   print(str);
          var str=await readJson(path);
          return str;
            // return json.decode(str);
        } 
        catch (err) {
            print(err);
            return json.decode(err);
        }
    }
  writeImage(String url) async{
    try{
       final res = await http.get(url);
       final image = img.decodeImage(res.bodyBytes);
       return image;
    }catch(e){
       print("############### 图片不存在或地址不正确 ########"+e.toString());
       final res = await http.get("http://www.168qcl-wap.com/App_Themes/UI/error/error.gif");
       final image = img.decodeImage(res.bodyBytes);
       return image;
    }
     
  }
  
  cacheImage(String headUrl,String name,String url) async{//写入img数据
   
       getLocalPath() //获取本地目录
        .then((localPath) {
          String path="${localPath}/temp/${headUrl}/${name}.jpg";
          return path;
        })
      .then((path)async{ //获取目的路径
        // print(path);
        File fileQuestions=File(path);  
        var flag=await fileQuestions.exists();
        print(flag);
        if(flag==true){//判断文件是否存在
         print("该图片已存在,正在覆盖。。。");
         var file=File(path);
              writeImage(url)
            .then((imageObj)async{
                 await file.writeAsBytes(img.encodePng(imageObj));
            }) 
            .then((m){
              print(file.path);
            print(file.statSync());
            });
        }else if(flag==false){
           print("该图片不存在,正在创建。。。");
          File(path).create(recursive: true)
          .then((file) {
            print(file.path);
            return file;
          })
          .then((file) async{
           writeImage(url)
            .then((imageObj)async{
                 await file.writeAsBytes(img.encodePng(imageObj));
            })
            .then((m){
              print(file.path);
              print(file.statSync());
            });

          });
        }

      });
      
  }
 
  cacheJson(String headUrl,String name,obj) async{//写入Json数据
       
       getLocalPath() //获取本地目录
      .then((localPath) {
        String path="${localPath}/temp/${headUrl}/${name}.json";
        return path;
      })
      .then((path)async{ //获取目的路径
        File fileQuestions=File(path);  
        var flag=await fileQuestions.exists();
         if(flag==true){
          print("该文件已存在,正在覆盖。。。");
          var file=File(path);
          writeJson(path,obj)
          .then((m){
            print(file.path);
            print(file.statSync()); 
         
          });
        
          }else{
              print("该文件不存在,正在创建目录。。。");
                File(path).create(recursive: true)
              .then((file) {
                print(file.path);
                return file;
              })
              .then((file) async{
                writeJson(path,obj)
                .then((m){
                  print(file.path);
                  print(file.statSync());
                });
              });
          }
      });
        
     
    }
 
  
   
  //####################  文件读写 END  ##############################
    //获取文档存储目录
       localAppPath() async {
        try {
            var tempDir = await getTemporaryDirectory();
            String tempPath = tempDir.path;

            var appDocDir = await getApplicationDocumentsDirectory();
            String appDocPath = appDocDir.path;

            print('临时目录: ' + tempPath);
            print('文档目录: ' + appDocPath);
            return appDocPath;
        }
        catch(err) {
            print(err);
            return "";
        }
    }
    //获取文件存储目录
    localPath() async {
        try {
            var tempDir = await getTemporaryDirectory();
            String tempPath = tempDir.path;

            var appDocDir = await getApplicationDocumentsDirectory();
            String appDocPath = appDocDir.path;

            print('临时目录: ' + tempPath);
            print('文档目录: ' + appDocPath);
            return tempPath;
        }
        catch(err) {
            print(err);
        }
    }
    localFile(path,name) async {
        return new File('$path/$name.json');
    }

    // 读取 json 数据
    readJSON(String name) async {
        try {
          print("正在读入文件。。。。。。。。。");
            final file = await localFile(await localPath(),name);
            String str = await file.readAsString();
            print(str);
            return json.decode(str);
            // return str;
        }
        catch (err) {
            print(err);
        }
    }

        readJSONData() async {
        try {
          print("正在读入文件。。。。。。。。。");
            // final file = await localFile("await localPath(),name");
            File file = File("/data/user/0/flutter.example.program/app_flutter/temp/10000450/questions/5C9AD002-1C64-3842-430E-09362094F96C.json");
            String str = await file.readAsString();
            print(str);
            return json.decode(str);
            // return str;
        }
        catch (err) {
            print(err);
        }
    }

    // 写入 json 数据
    writeJSON(obj,String name) async{
        try {
          print("正在写入文件。。。。。。。。。");
            final file = await localFile(await localPath(),name);
            return file.writeAsString(json.encode(obj));
        }
        catch (err) {
            print(err);
        }
    }

//=====================================
 /// 获取url字符串的MD5值
  static String getUrlMd5(String url) {
    var content = new Utf8Encoder().convert(url);
    var digest = md5.convert(content);
    return digest.toString();
  }

  /// 获取图片缓存路径
  Future<String> getCachePath() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Directory cachePath = Directory("${dir.path}/imagecache/");
    if(!cachePath.existsSync()) {
      cachePath.createSync();
      print("######  NONE ################");
    }
    return cachePath.path;
  }

  /// 判断是否有对应图片缓存文件存在
  Future<Uint8List> getFileBytes(String url) async {
    String cacheDirPath = await getCachePath();
    String urlMd5 = getUrlMd5(url);
    File file = File("$cacheDirPath/$urlMd5");
    print("读取文件:${file.path}");
    if(file.existsSync()) {
      return await file.readAsBytes();
    }

    return null;
  }

  /// 将下载的图片数据缓存到指定文件
  Future saveBytesToFile(String url, Uint8List bytes) async {
    String cacheDirPath = await getCachePath();
    String urlMd5 = getUrlMd5(url);
    File file = File("$cacheDirPath/$urlMd5");
    if(!file.existsSync()) {
      file.createSync();
      await file.writeAsBytes(bytes);
    }
  }
  //写入Json数据 
  writeJsonUrl(String url,String name,obj) async {
    print("#####################  _0");
    // String appDocPath = localAppPath(); // 应用文件夹
        var tempDir = await getTemporaryDirectory();
            String tempPath = tempDir.path;

            var appDocDir = await getApplicationDocumentsDirectory();
            String appDocPath = appDocDir.path;
     print("#####################  _0.5");
    String questions="${appDocPath}/temp/${url}/${name}.json"; print("#####################  _1");
    File fileQuestions=File(questions);     print("#####################  _2");
    var flag=await fileQuestions.exists();
    if(flag==true){
    print("该文件已存在,正在覆盖。。。");
        var file=File(questions);
        writeJsonData(name,obj); 
        print(file.path);
        print(file.statSync());
  }else{
      print("该文件不存在,正在创建目录。。。");
        File(questions).create(recursive: true)
      .then((file) {
        print(file.path);
        return file;
      }).then((file) async{
              await writeJsonData(name,obj);  // 需要使用与图片格式对应的encode方法
              print(file.path);
            print(file.statSync());
      });
  }
       try {
          print("正在写入文件。。。。。。。。。");
            final file = await localFile(await localPath(),name);
            return file.writeAsString(json.encode(obj));
        }
        catch (err) {
            print(err);
        }
      
  }
  writeJsonData(String name,obj) async{
      try {
        print("正在写入文件。。。。。。。。。");
        final file = await localFile(await localPath(),name);
        return file.writeAsString(json.encode(obj));
    }
    catch (err) {
        print(err);
    }
  }
   
   //缓存图片
 fetchImage(String url,String name) async {
    final res = await http.get(url);
    print("+++++ url");
    final image = img.decodeImage(res.bodyBytes);

    Directory appDocDir = await getApplicationDocumentsDirectory();
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path; // 临时文件夹
    String appDocPath = appDocDir.path; // 应用文件夹

    String images="${appDocPath}/temp/images/${name}.png";
    File file_image=File(images);
    var flag=await file_image.exists();
    if(flag==true){
        print("该文件已存在,正在覆盖。。。");
           var file=File(images);
           await file.writeAsBytes(img.encodePng(image)); // 需要使用与图片格式对应的encode方法
           print(file.path);
           print(file.statSync());
     }else{
          print("该文件不存在,正在创建目录。。。");
           File(images).create(recursive: true)
          .then((file) {
            print(file.path);
            return file;
          }).then((file) async{
                  await file.writeAsBytes(img.encodePng(image)); // 需要使用与图片格式对应的encode方法
                  print(file.path);
                print(file.statSync());
          });
     }
   

    // getFileBytes(String url);
  }
   
   Future creatFile(String path){
     return  new File('${path}/temp/images').create(recursive: true)
        .then((file) {
          print(file.path);
          file.exists().then(print);
          return file.path;
        });
        
   }
   //Unicode转中文
   String unicodeText(String text){
     Runes runes = new Runes(text);
     print(String.fromCharCodes(runes));
     return String.fromCharCodes(runes);
   }


   
}//

//小工具
  //处理时间戳
  String timeShow(var timestamp){
       var  date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
          String Y = date.year.toString() + '-';
          String M = (date.month+1 < 10 ? '0'+(date.month+1).toString() : date.month+1).toString() + '-';
          String D = date.day.toString()+ ' ';
          String h = date.hour < 10 ? ('0' + date.hour.toString() + ':') : (date.hour.toString()  + ':');
          String m = date.minute < 10 ? ('0' + date.minute.toString()) : (date.minute).toString();
          // print(Y+M+D+h+m); 
          return (Y+M+D+h+m);
  }
