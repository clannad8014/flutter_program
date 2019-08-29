class resultList {
  int code;
  String message;
  List<Result_list> result_list;

  resultList({this.code, this.message, this.result_list});

  resultList.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['result'] != null) {
      result_list = new List<Result_list>();
      json['result'].forEach((v) {
        result_list.add(new Result_list.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.result_list != null) {
      data['result'] = this.result_list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result_list {
  String author;
  String link;
  String pic;
  String type;
  String title;
  String lrc;
  int songid;
  String url;

  Result_list(
      {this.author,
      this.link,
      this.pic,
      this.type,
      this.title,
      this.lrc,
      this.songid,
      this.url});

  Result_list.fromJson(Map<String, dynamic> json) {
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