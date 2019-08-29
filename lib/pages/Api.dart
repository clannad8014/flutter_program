import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:program/model/questionModel.dart';
import 'package:program/model/tools.dart' as prefix0;
import '../service/service_method.dart';
import 'dart:convert' as convert;
import '../model/questionModel.dart';
import '../model//tools.dart';
/**
 * APi测试界面
 */
  // 读取 json 数据
    readJSON() async {
        try {
          print("正在读入文件。。。。。。。。。");
            // final file = await localFile(await localPath(),name);
            File file=new File("/data/user/0/com.example.program/app_flutter/temp/10000454/questions/5C9AD002-1C64-3842-430E-09362094F96C.json");
            String str = await file.readAsString();
            print(str);
            return json.decode(str);
            // return str;
        }
        catch (err) {
            print(err);
        }
    }
        readJson(String path) async {
        try {
          print("正在读入文件。。。。。。。。。");
            // final file = await localFile(await localPath(),name);
            File file=new File(path);
            String str = await file.readAsString();
            print("+++++  ${path}  ");
            print(str);
            return json.decode(str);
            // return str;
        }
        catch (err) {
            print(err);
        }
    }



class Api extends StatefulWidget {
  Api({Key key}) : super(key: key);

  _ApiState createState() => _ApiState();
}
var loginResultList,noticeResultList,unitResultList,questionResultList,answerResultList,selectResultList;
String res1="__",res2="__",res3="__",res4="__",res5="__",res6="__";
String token="__";
String exam_id="__";
String question=" ";
String questionsTitleList=" ";
var questionCode=0;
class _ApiState extends State<Api> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:  Container(
         child: ListView(
           
           children: <Widget>[
               RaisedButton(
               onPressed: (){
                    // getQuestion(t);
                    cacheQuestionData();//缓存所有试题信息
                    tools tool=new tools();
                    // tool.writeJSON(loginResultList, "name");

                    // tool.createPath("/data/user/0/com.example.program/app_flutter/temp/10000454/questions/3434.json");
                    // tool.writeJson(noticeResultList,"/data/user/0/com.example.program/app_flutter/temp/10000454/questions/3434.json");
                  //  tool.cacheJson("asf11qssq/json","223q371",loginResultList);

                    
               },
               child: Text("getQuestion测试"),
             ),
             Image(image: FileImageEx(File("/data/user/0/flutter.example.program/app_flutter/temp/10000454/images/14CB0ADE-78AB-B05C-5AB4-5E4A75656B41.jpg"))),
            //  new Image.network("http://www.168qcl-wap.com/App_Themes/UI/error/error.gif"),
              RaisedButton(
               onPressed: (){
                    // readJSON() ;
                   tools tool=new tools();
                  var a= tool.readJson("/data/user/0/flutter.example.program/app_flutter/temp/10000454/questions/5C9AD002-1C64-3842-430E-09362094F96C.json");
                  
                  //  var a= tool.readJson("/data/user/0/com.example.program/app_flutter/temp/10000454/questions/0957883B-D8E8-26A1-B6A3-26E931CD43D2.json");
                   a.then((val){
                      print(val);
                      print(val['data']);
                       print(val['data']['exam_id']);
                       var examId=val['data']['exam_id'];
                      print(" ================ ");

                    //   //测试图片判断
                    //   print(val['data']['questions'][0]['question_body']);
                    //  List<String> ReImg = val['data']['questions'][0]['question_body'].split("<br /><img src");
                    //  print(" length: ${ReImg.length}  ${ReImg[0]}");

                      val['data']['questions'].forEach((item) {
                        var questionId=item['question_id'];
                        // print(item['question_body']);
                        List<String> ReImg = item['question_body'].split("<br /><img src");
                        if(ReImg.length>1){
                             print("############# 开始缓存图片###############");
                            print(" length: ${ReImg.length}  ### ${ReImg[1]}");
                           var img=spitImg(item["question_body"]);
                            tool.cacheImage("${examId}/images",questionId,img)
                              .then((m){
                              print("############# 图片缓存成功 ###############");
                              });
                          
                        }
                        
                        // print(val['data']['questions'][1]['question_body']);
                      });

                      // print(val['data']['questions'][1]['question_body']);
                      // print(val['data']['questions'][1]['options']);
                      var title=val['data']['questions'][0]['question_body'];
                      var options=val['data']['questions'][1]['options'];
                      var question= spitQuestion(title);
                      print(question);
                      var img=spitImg(title);
                    

                   });
                 
               },
               child: Text("readJSON"),
             ),
          Container(
              height: 50,
              child:  new ListView(
            scrollDirection:Axis.horizontal,
            children: <Widget>[
                RaisedButton(
                    onPressed: (){
                          // postLoginApi();
                    },
                    child: Text("缓存question"),
                  ),
                  SizedBox(width: 20,),
                  RaisedButton(
                  onPressed: (){
                       tools tool=new tools(); //10000454/notice
                                     ///data/user/0/flutter.example.program/app_flutter/temp/10000454/notice/notice.json
                       tool.readJson("/data/user/0/flutter.example.program/app_flutter/temp/10000454/notice/notice.json")
                          .then((val){
                            print(val['notice']);
                    
                          });
                  },
                  child: Text("读取试题数据"),
                ),
                 SizedBox(width: 20,),
                   RaisedButton(
                  onPressed: (){
                      tools tool=new tools();
                      var localPath=tool.getLocalPath();
                          localPath.then((localPath){
                                print("++  ${localPath}  ++");
                                String localUrl="${localPath}/temp/10000454/questions/5C9AD002-1C64-3842-430E-09362094F96C.json";
          // var questionResult= tool.readJson("/data/user/0/com.example.program/app_flutter/temp/10000454/questions/5C9AD002-1C64-3842-430E-09362094F96C.json");
        

                          });
                      print("++++");
                  },
                  child: Text("LocalPath测试"),
                ),
            ],
          ),
 
            ),
           
             Container(
               height: 200,
              child: ListView(
                children: <Widget>[
                  Text(questionsTitleList),
                ],
              ),
             ),
             SizedBox(height: 30,),
             Text("接口测试"),
             RaisedButton(
               onPressed: (){
                    postLoginApi();
               },
               child: Text("login测试"),
             ),
               Container(
                  height: ScreenUtil().setHeight(300),
                  width:ScreenUtil().setWidth(300),  
                  child: Image.network('http://jikao.oss-cn-beijing.aliyuncs.com/testdata/355C983A-4C0F-6C27-2C26-E46D48AC5658/photo/0CD10476-BD1E-7BCA-8B04-F05AAE5E608B.jpg'),//封面
                  alignment: FractionalOffset.center,
                ),
             Text(res1),
             //===============================
               SizedBox(height: 30,),
             RaisedButton(
               onPressed: (){
                   print(token);
                   postNoticeApi();
               },
               child: Text("notice测试"),
             ),
             Text(res2),
             //===============================
               SizedBox(height: 30,),
             RaisedButton(
               onPressed: (){
                  postUnitApi();
               },
               child: Text("unit测试"),
             ),
             Text(res3),

              //===============================
               SizedBox(height: 30,),
             RaisedButton(
               onPressed: (){
                  // postQuestionApi();
               },
               child: Text("question测试"),
             ),
             Text(res4),
           ],
         ),
       
    )
    );
  }
  var idcard='9987';   //身份证号
  var cand_id=1000456623;  //准考证号 
  var unitIdList,questionsIdList;
  void postLoginApi() async{//登录数据获取
       FormData formData = new FormData.from({
           "idcard":int.parse(idcard),
           "cand_id":cand_id,
        });
          await requestApi("login",formData).then((val){
            var valJson = json.decode(val);
            if(valJson['code']==0){
                print(valJson['data']);
              print(valJson['data']["token"]);
              noticeResultList=valJson['data'];
              //====================
             loginResultList=valJson['data']; 
            print(loginResultList['org_name']);
            token=loginResultList['token'];
            exam_id=loginResultList['exam_id'];

            print(exam_id);
            }else{
                print("##############code: ${valJson['code']} : ${valJson['message']} ###########################");
            }

           loginResultList=valJson;
           setState(() {
               res1=loginResultList.toString();
           });

          });
  }
  
  void postNoticeApi()async{//notice数据获取
       FormData formData = new FormData.from({
           "exam_id":exam_id,
           "cand_id":cand_id,
           "token":token,
        });
          await requestApi("notice",formData).then((val){
            var valJson = json.decode(val);
            print(valJson); 
        
            if(valJson['code']==0){
                print(valJson['data']);
              noticeResultList=valJson['data'];
              tools tool =new tools();
                tool.cacheJson("10000454/notice", "notice", noticeResultList)
                    .then((m){
                        print("################# enddd");
                    });
              // print("#################  2");
              // print(noticeResultList['ques_list'][1]);
              //  a=noticeResultList['ques_list'].keys.toList();
              //  b=noticeResultList['ques_list']['${a[0]}'];
              // print(a[0]);
              // print(noticeResultList['ques_list']['2071F085-CDFC-C17B-2334-2EE5488948C3']);
              // map = new Map();
              // map.addAll({"exam_id":10000454,"unit_id":"${a[0]}","cand_id":1000456495,"questions": ["14CB0ADE-78AB-B05C-5AB4-5E4A75656B41","14CB0ADE-78AB-B05C-5AB4-5E4A75656B41"],"token":token,});
//           
              // print(map);
              // print(noticeResultList['ques_list']["${a[0]}"]);
               
              //======================
              //==================
             

              

            }else{
                print("##############code: ${valJson['code']} : ${valJson['message']} ###########################");
            }
            //  noticeResultList=valJson;
             
           setState(() {

               res2=noticeResultList.toString();
           });

          });
        //   var jsonString = convert.jsonEncode(b);
        //   FormData form = new FormData.from({
        //    "exam_id":exam_id,
        //    "unit_id":'${a[0]}',
        //    "cand_id":cand_id,
        //    "questions":jsonString,
        //    "token":token,
        // });
        // print(a[0]);
        //     await requestApi("question",form).then((val){
            
        //     var valJson = json.decode(val);

        //     print(valJson );
        //     print("+++++++++++++++++++++++++++++ ojkb");
        //     print(b.toString());
          
        //     // print(noticeResultList['ques_list']['2071F085-CDFC-C17B-2334-2EE5488948C3'][0]);
        //     }
        //          );
  }
  
  void postUnitApi()async{//unit数据获取
       FormData formData = new FormData.from({
           "exam_id":exam_id,
           "cand_id":cand_id,
           "token":token,
        });
          await requestApi("unit",formData).then((val){
             var valJson = json.decode(val);
         if(valJson['code']==0){
            print(valJson['data']);
            unitResultList=valJson['data'];
         }else{
                print("##############code: ${valJson['code']} : ${valJson['message']} ###########################");
            }
            // print(noticeResult['org_name']);
           setState(() {

               res3=unitResultList.toString();
           });

          });
  }
        var questionList='["D039FDA8-549E-EE2A-B031-E5933A9AE38F","D039FDA8-549E-EE2A-B031-E5933A9AE38F"]';
        // var a='%5B%22ECE2B007-5A41-A083-17AA-35A0E190C3DC%22%2C%2258E34C8A-7FAB-A09B-9B23-D41771081362%22%2C%224B4DDC8A-668E-3462-2290-36C0DED45159%22%2C%22F0DFD3FE-2225-8FA6-ADC7-DC9AA60E8CCC%22%2C%22E26E4D82-D8D5-B7E7-F9FD-C794FD4C0493%22%5D';
  Future postQuestionApi(String unit_id,var questions)async{//question数据获取
       FormData formData = new FormData.from({
           "exam_id":exam_id,
           "unit_id":unit_id,
           "cand_id":cand_id,
           "questions":questions,
           "token":token,
        });
        var val0;
          await requestApi("question",formData).then((val){
            val0=val;
            var valJson = json.decode(val);
            questionCode=valJson['code'];
            if(questionCode==0){
              // print(valJson['data']);
              questionResultList=valJson['data'];
              // print(questionResultList['unit_id']);
              // print(questionResultList['questions']); print("+++++++++++++++++");
              // print(questionResultList['questions'][0]['question_body']);
              QuestionModle result=QuestionModle.fromJson(valJson);
              // print(result.data.unitId);
              // print(result.data.questions[0].questionBody);
              
            }else{
                print("##############code: ${valJson['code']} : ${valJson['message']} ###########################");
            }
            
          //  spitImg(questionResultList['questions'][0]['question_body']);
           setState(() {
               res4= questionResultList['questions'][0]['question_body'].toString();
               res4+=questionResultList.toString();
           });

          });
         return questionCode==0? val0 : "";
  }
   
    void cacheQuestionImages(String localPath,){//缓存所有带图片的试题图片
          tools tool=new tools();
          var questionResult= tool.readJson(localPath);
          questionResult.then((val){
              print(val);
              print(val['data']);
              var examId=val['data']['exam_id'];

              val['data']['questions'].forEach((item) {//循环缓存图片
                    
                var questionId=item['question_id']; //考试场次
                List<String> ReImg = item['question_body'].split("<br /><img src");
                if(ReImg.length>1){//判断试题有无图片
                   print(" ############  开始缓存图片  ################ ");
                    print(" length: ${ReImg.length}  ### ${ReImg[1]}");
                    var img=spitImg(item["question_body"]);
                    tool.cacheImage("${examId}/images",questionId,img)
                        .then((m){
                              print("############# 图片缓存成功 ###############");
                        });

                 }
                
              });

            });
    }
    void cacheQuestionData(){//缓存试题数据
            
           unitIdList=noticeResultList['ques_list'].keys.toList();
          print(unitIdList.length);
          for(var i=0;i<unitIdList.length;i++){//缓存所有question信息
             var unit_id=unitIdList[i];
               print("=========  ${unit_id}   ===========");
              //对应的questionid List
              questionsIdList=noticeResultList['ques_list'][unit_id];
              var questions = convert.jsonEncode(questionsIdList);
                 tools tool=new tools();
              postQuestionApi(unit_id, questions).then((val){//获取试题信息

                    print("#####################################  start");
                    var valJson = json.decode(val);
                     print(valJson);
                    QuestionModle result=QuestionModle.fromJson(valJson);
                 
                    tool.cacheJson("10000454/questions",unit_id,valJson)
                     .then((m){
                           var localPath=tool.getLocalPath();
                          localPath.then((localPath){
                                print("++  ${localPath}  ++");
                                String localUrl="${localPath}/temp/10000454/questions/${unit_id}.json";
                                cacheQuestionImages(localUrl);
                          });
                     });
                    print("#####################################  end : "+i.toString());
              });
              
          }
    
    }

    void getQuestion()async{

        //    FormData formData = new FormData.from({
        //    "exam_id":exam_id,
        //    "cand_id":cand_id,
        //    "token":token,
        // });
        //    var map,a,b;
        
        //   await requestApi("notice",formData).then((val){
        //     var valJson = json.decode(val);
        //     print("#################  1");
        //     print(valJson); 
        //     if(valJson['code']==0){
        //         print(valJson['data']);
        //       noticeResultList=valJson['data'];
        //       print("#################  2");
        //       print(noticeResultList['ques_list'][1]);
        //        a=noticeResultList['ques_list'].keys.toList();
        //        b=noticeResultList['ques_list']['${a[0]}'];
        //       print(a[0]);
        //       print(noticeResultList['ques_list']['2071F085-CDFC-C17B-2334-2EE5488948C3']);
        //     }
        //   });
//====================================
         
          // print(exam_id);print("${unitIdList[0]}");print(cand_id);print(questions);print(token);
             //单元id List
            
          unitIdList=noticeResultList['ques_list'].keys.toList();
            
      
          print(unitIdList.length);
          for(var i=0;i<unitIdList.length;i++){
             var unit_id=unitIdList[i];
              //对应的questionid List
              questionsIdList=noticeResultList['ques_list'][unit_id];
              var questions = convert.jsonEncode(questionsIdList);
              postQuestionApi(unit_id, questions).then((val){
                    print("#####################################  start");
                    // print(val);
                    var valJson = json.decode(val);
                     print(valJson);
                    QuestionModle result=QuestionModle.fromJson(valJson);
                    tools tool=new tools();
                    // tool.writeJsonUrl("10000454/questions", valJson['data']["unit_id"], valJson);
                    // tool.cacheJson("10000454/questions",valJson['data']["unit_id"],valJson);
                    tool.cacheJson("10000454/questions",valJson['data']["unit_id"],valJson);
                    String url="${valJson['data']["exam_id"]}/questions";
                    print(url);
                    print("#####################################  end : "+i.toString());

                    print(i);
              });
              
          }
          //     tools tool=new tools();
          //     tool.writeJsonUrl("10000454/questions", "5C9AD002-1C64-3842-430E-09362094F96C",noticeResultList);
          print("################## end");
        //   FormData form = new FormData.from({
        //    "exam_id":exam_id,
        //    "unit_id":unit_id,
        //    "cand_id":cand_id,
        //    "questions":questions,
        //    "token":token,
        // });
        //     await requestApi("question",form).then((val){
        //     var valJson = json.decode(val);
        //     print(valJson );
        //     print("+++++++++++++++++++++++++++++ ojkb");
        //     setState(() {
        //        questionsTitleList=valJson.toString();
        //     });
            //=============
          //   }
          // );
    }
}//

//获取考试题目
String spitQuestion(String str){
 List<String> ReImg = str.split("<br /><img src");
   return ReImg[0];
} 
//获取考试图片地址
   spitImg(String str){
  RegExp exp = new RegExp(r"(http(s?):)([/|.|\w|\s|-])*\.(?:jpg|gif|png)");
        Iterable<Match> matches = exp.allMatches(str);
        var img;
        matches.toList().forEach((item) {
          // print(item[0]);
          img=item[0];
        });
        return img;
} 


//更新本地图片
class FileImageEx extends FileImage {
  int fileSize;
  FileImageEx(File file, { double scale = 1.0 })
      : assert(file != null),
        assert(scale != null),
        super(file, scale: scale) {
    fileSize = file.lengthSync();
  }

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType)
      return false;
    final FileImageEx typedOther = other;
    return file?.path == typedOther.file?.path
        && scale == typedOther.scale && fileSize == typedOther.fileSize;
  }

}