class musicResult {
  int code;
  String message;
  List<Result> musicresult;

  musicResult({this.code, this.message, this.musicresult});

  musicResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['result'] != null) {
      musicresult = new List<Result>();
      json['result'].forEach((v) {
        musicresult.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.musicresult != null) {
      data['result'] = this.musicresult.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String author;
  String link;
  String pic;
  String type;
  String title;
  String lrc;
  int songid;
  String url;

  Result(
      {this.author,
      this.link,
      this.pic,
      this.type,
      this.title,
      this.lrc,
      this.songid,
      this.url});

  Result.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    link = json['link'];
    pic = json['pic'];
    type = json['type'];
    title = json['title'];
    lrc = json['lrc'];
    songid = json['songid'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['link'] = this.link;
    data['pic'] = this.pic;
    data['type'] = this.type;
    data['title'] = this.title;
    data['lrc'] = this.lrc;
    data['songid'] = this.songid;
    data['url'] = this.url;
    return data;
  }
}