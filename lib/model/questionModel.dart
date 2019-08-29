class QuestionModle {
  int code;
  String message;
  Data data;

  QuestionModle({this.code, this.message, this.data});

  QuestionModle.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String examId;
  String unitId;
  String candId;
  int leftTime;
  List<Questions> questions;

  Data({this.examId, this.unitId, this.candId, this.leftTime, this.questions});

  Data.fromJson(Map<String, dynamic> json) {
    examId = json['exam_id'];
    unitId = json['unit_id'];
    candId = json['cand_id'];
    leftTime = json['left_time'];
    if (json['questions'] != null) {
      questions = new List<Questions>();
      json['questions'].forEach((v) {
        questions.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exam_id'] = this.examId;
    data['unit_id'] = this.unitId;
    data['cand_id'] = this.candId;
    data['left_time'] = this.leftTime;
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String questionId;
  String questionType;
  String questionRes;
  String questionBody;
  Options options;
  String score;
  String factAnswer;
  int code;
  String message;
  int isSigned;
  int unitSort;
  int allSort;
  int unitNum;

  Questions(
      {this.questionId,
      this.questionType,
      this.questionRes,
      this.questionBody,
      this.options,
      this.score,
      this.factAnswer,
      this.code,
      this.message,
      this.isSigned,
      this.unitSort,
      this.allSort,
      this.unitNum});

  Questions.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    questionType = json['question_type'];
    questionRes = json['question_res'];
    questionBody = json['question_body'];
    options =
        json['options'] != null ? new Options.fromJson(json['options']) : null;
    score = json['score'];
    factAnswer = json['fact_answer'];
    code = json['code'];
    message = json['message'];
    isSigned = json['is_signed'];
    unitSort = json['unit_sort'];
    allSort = json['all_sort'];
    unitNum = json['unit_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question_id'] = this.questionId;
    data['question_type'] = this.questionType;
    data['question_res'] = this.questionRes;
    data['question_body'] = this.questionBody;
    if (this.options != null) {
      data['options'] = this.options.toJson();
    }
    data['score'] = this.score;
    data['fact_answer'] = this.factAnswer;
    data['code'] = this.code;
    data['message'] = this.message;
    data['is_signed'] = this.isSigned;
    data['unit_sort'] = this.unitSort;
    data['all_sort'] = this.allSort;
    data['unit_num'] = this.unitNum;
    return data;
  }
}

class Options {
  String a;
  String b;
  String c;
  String d;

  Options({this.a, this.b, this.c, this.d});

  Options.fromJson(Map<String, dynamic> json) {
    a = json['A'];
    b = json['B'];
    c = json['C'];
    d = json['D'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['A'] = this.a;
    data['B'] = this.b;
    data['C'] = this.c;
    data['D'] = this.d;
    return data;
  }
}