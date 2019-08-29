import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:program/model/questionModel.dart';
import 'package:program/model/tools.dart' as prefix0;
import 'package:program/pages/view/ConfirmInformation.dart';
import '../service/service_method.dart';
import 'dart:convert' as convert;
import '../model/questionModel.dart';
import '../model//tools.dart';

import './loginViewTest.dart';
/**
 * A业务逻辑梳理
 */


class ApiTest extends StatefulWidget {
  ApiTest({Key key}) : super(key: key);

  _ApiTestState createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body:  Container(
        child: Row(
           children: <Widget>[
                leftView(),
                     Padding(//分割线
                      padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(0),0, 
                        ScreenUtil().setWidth(0),0),
                        child:Container(height: ScreenUtil().setHeight(850), width: 2.0, color: Colors.black12,),
                  ),
                rigthtView()
           ],
         )

         )
         );
  }
  
   
  Widget leftView(){
    return Container(
      width: 500,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 30,),
          Text("========"),
          RaisedButton(
            onPressed: (){
              postLoginApi();
            },
            child: Text("loginPost"),
          ),
           RaisedButton(
            onPressed: (){
              postNoticeApi();
            },
            child: Text("noticePost"),
          ),
            RaisedButton(
            onPressed: (){
               cacheQuestionData();//获取所有试题数据
            },
            child: Text("获取所有试题数据"),
          ),
           RaisedButton(
            onPressed: (){
              var questions='["94A0C5BB-F8EC-CD20-71F6-F88FF69CAB97","D039FDA8-549E-EE2A-B031-E5933A9AE38F","14CB0ADE-78AB-B05C-5AB4-5E4A75656B41",null,null]';
             postQuestionApi("5C9AD002-1C64-3842-430E-09362094F96C", questions).then((val){
                         print(val);
             });
            },
            child: Text("PostQuestionc测试"),
          ),
           RaisedButton(
            onPressed: (){
              tool.readJson("/data/user/0/flutter.example.program/app_flutter/temp/10000456/questionsData/6E39323A-5E17-0A7B-E7FB-038C9A930E6C.json");
              // tool.readJson("/data/user/0/flutter.example.program/app_flutter/temp/10000456/questionData/6E39323A-5E17-0A7B-E7FB-038C9A930E6C.json");
              
            },
            child: Text("读取question Json"),
          ),
             RaisedButton(
              onPressed: (){ 
                   postUnitApi(); 
                   
                },
            child: Text("unitPost"),
          ),
            RaisedButton(
              onPressed: (){ 
                 cacheData();
                },
            child: Text("信息确认后"),
          ), 
             RaisedButton(
              onPressed: (){ 
                   postSelectApi("5C9AD002-1C64-3842-430E-09362094F96C"); 
                },
            child: Text("选题 select"),
          ),
             RaisedButton(
              onPressed: (){ 
                   postAnswerApi("unitId", "answer");
                },
            child: Text(" answer "),
          ),
          RaisedButton(
              onPressed: (){ 
                     Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context)=> ShowTestView()
                      ));
                },
            child: Text(" 跳转测试 "),
          ),
          Image(image: FileImageEx(File("/data/user/0/flutter.example.program/app_flutter/temp/10000456/images/14CB0ADE-78AB-B05C-5AB4-5E4A75656B41.jpg"))),
           
        ],
      ),
    );
  }

  Widget rigthtView(){
    return Container(
      width: 600,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 20,),
          Text(loginResult.toString().length>4?loginResult.toString():" login信息加载中。。。。" ),
          Container(height: 1, color: Colors.grey, ),
          SizedBox(height: 10,),
          Container(
            height: 300,
            color: Colors.blueGrey[100],
            child: ListView(
              children: <Widget>[
                  Text(noticeResult.toString().length>4?noticeResult.toString():" notice信息加载中。。。。" ),
              ],
              
            ),
          ),
          Container(height: 1, color: Colors.grey, ),
          SizedBox(height: 10,),
           Container(
            height: 300,
            color: Colors.orangeAccent[100],
            child: ListView(
              children: <Widget>[
                  Text(unitResult.toString().length>4?unitResult.toString():" unit信息加载中。。。。" ),
              ],
              
            ),
          ),
          //questionsResult
            SizedBox(height: 10,),
          Container(
            height: 300,
            color: Colors.lightGreenAccent[100],
            child: ListView(
              children: <Widget>[
                  Text(questionsResult.toString().length>4?questionsResult.toString():" questionsResult信息加载中。。。。" ),
              ],
              
            ),
          ),
        ],
      ),
    );
  }

  var idcard='110105198208082238';   //身份证号
  var candId=1000456628;  //准考证号
  String token;
  var examId;
  var loginResult,noticeResult,questionsResult,unitResult;
  tools tool=new tools();

    postLoginApi() async{//登录数据获取
       FormData formData = new FormData.from({
           "idcard":int.parse(idcard),
           "cand_id":candId,
        });
          await requestApi("login",formData).then((val){
            var valJson = json.decode(val); 
            if(valJson['code']==0){
              //  print(valJson['data']);
              // print(valJson['data']["token"]);
              loginResult=valJson['data'];
              //====================
            // print(loginResult['org_name']);
            token=loginResult['token'];
            examId=loginResult['exam_id'];
            //写入本地
            tool.cacheJson("${examId}/loginData", "login", valJson);
          
            }else{
                print("##############code: ${valJson['code']} : ${valJson['message']} ###########################");
                loginResult="##############code: ${valJson['code']} : ${valJson['message']} ###########################";
            }

         
           setState(() {
              //  loginResult=loginResultList.toString();
           });

          });

  }

    postNoticeApi()async{//notice数据获取
       FormData formData = new FormData.from({
           "exam_id":examId,
           "cand_id":candId,
           "token":token,
        });
          await requestApi("notice",formData).then((val){
            var valJson = json.decode(val);
            print(valJson); 
        
            if(valJson['code']==0){
                // print(valJson['data']);
              noticeResult=valJson['data'];
              //notice写入本地
              tool.cacheJson("${examId}/noticeData", "notice", noticeResult);

            }else{
                print("##############code: ${valJson['code']} : ${valJson['message']} ###########################");
            }
            //  noticeResultList=valJson;
             
           setState(() {

           });

          });
  
  }
  
    postUnitApi()async{//unit数据获取
       FormData formData = new FormData.from({
           "exam_id":examId,
           "cand_id":candId,
           "token":token,
        });
         var res=await requestApi("unit",formData).then((val){
             var valJson = json.decode(val);
         if(valJson['code']==0){
            print(valJson['data']);
            unitResult=valJson['data'];
           
            //unit写入本地
            tool.cacheJson("${examId}/unitData", "unit", valJson);
         }else{
                print("##############code: ${valJson['code']} : ${valJson['message']} ###########################");
            } 
           setState(() {

              //  res3=unitResultList.toString();
           });

          });
          return res;
  }

    Future postQuestionApi(String unitId,var questions)async{//question数据获取
      FormData formData = new FormData.from({
          "exam_id":examId,
          "unit_id":unitId,
          "cand_id":candId,
          "questions":questions,
          "token":token,
      });
      var val0,questionCode;
        await requestApi("question",formData).then((val){ 
          var valJson = json.decode(val);
          val0=valJson;  
           questionCode=valJson['code'];
          if(questionCode==0){
            // print(valJson['data']); 
            //=======  question写入本地  ==============
            tool.cacheJson("${examId}/questionsData",unitId, valJson);
            print(valJson);

             
             //==========  缓存图片 ============================
             int count=valJson['data']['questions'].length;
             for(int i=0;i<count;i++){
                String questionBody=valJson['data']['questions'][i]['question_body'];
                String questionId=valJson['data']['questions'][i]["question_id"];

                List<String> ReImg =questionBody.split("<br /><img src");
                 if(ReImg.length>1){//如果试题有图片
                   print(" ############  开始缓存图片  ################ ");
                    print(" length: ${ReImg.length}  ### ${ReImg[1]}");
                    var img=spitImg(questionBody);
                    tool.cacheImage("${examId}/images",questionId,img);

                 }// if 
             }// for  
           
            
          }else{
              print("##############code: ${valJson['code']} : ${valJson['message']} ###########################");
          }
          
       
          setState(() {
           
          });

        });
        return questionCode==0? val0 : "";
  }
    
    postSelectApi(String unitId) async{
        FormData formData = new FormData.from({
           "exam_id":examId,
           "unit_id": unitId,
           "cand_id":candId,
           "token":token,
        });
          await requestApi("select",formData).then((val){
             var valJson = json.decode(val);
         if(valJson['code']==0){
            print(valJson['data']);
            unitResult=valJson['data']; 
            //select写入本地
            tool.cacheJson("${examId}/SelectData", unitId, valJson);
         }else{
                print("##############code: ${valJson['code']} : ${valJson['message']} ###########################");
            } 
          }); 
 
   }
  

    postAnswerApi(String unitId ,answer) async{//answer 提交作答过程
     var answer1=[{"question_id":"424EBCA3-FEC1-9BDB-36C6-6935DE411F8B","question_type":"S","fact_answer":"D","is_signed":0},{"question_id":"292A748F-08C8-E0D9-FCA4-C7E20749F86D","question_type":"S","fact_answer":"B","is_signed":0},{"question_id":"9C909CB8-B61D-E7F3-AB3C-71C365E52660","question_type":"S","fact_answer":"A","is_signed":0},{"question_id":"061CDA09-7C77-7065-E1C6-C8B3EA91A2DE","question_type":"S","fact_answer":"D","is_signed":0},{"question_id":"82AF2B1F-6DD5-3CB7-F229-D3AC8E9D82F7","question_type":"S","fact_answer":"C","is_signed":0}];
     var questions = convert.jsonEncode(answer1);  
    
    //========== 生成作答记录 answer =========
        var testList = List();  
      var testMap2 = {
         "question_id":"424EBCA3-FEC1-9BDB-36C6-6935DE411F8B",
         "question_type":"S",
         "fact_answer":"D",
         "is_signed":0
        };
        testList.add(testMap2);
        questions = convert.jsonEncode(testList);  
        print(questions);
             print("**********************************");
      //===================
          FormData formData = new FormData.from({
           "exam_id":examId,
           "unit_id":'ATS-Job_Behavior_Risk-9222160672',
           "cand_id":candId,
           "answers":questions,
           "token":token,
         });
            await requestApi("answer",formData).then((val){
             var valJson = json.decode(val);
         if(valJson['code']==null ){//提交失败 
            print(valJson); 

            // //answer写入本地
            // tool.cacheJson("${examId}/AnswerData", unitId, valJson);
         }else{
                  print("##############code: ${valJson['code']} : ${valJson['message']} ###########################");
            } 
          });
           
    }
    
    createAnswerPost(){//生成作答记录
           //=======================
      // print(answer1[0]);
      // print(answer1[0]['question_id']);

      
      var testList = List();  
      var testMap2 = {
         "question_id":"424EBCA3-FEC1-9BDB-36C6-6935DE411F8B",
         "question_type":"S",
         "fact_answer":"D",
         "is_signed":0
        };
      
    
     List a=["424EBCA3-FEC1-9BDB-36C6-6935DE411F8B",'S',"ss",34];
     for(int i=0;i<4;i++){
        var testMap2 = {
         "question_id":"szsddds",
         "question_type":"S",
         "fact_answer":"D",
         "is_signed":0
        };
        testMap2["question_id"]=a[i];
        // testMap2["question_type"]="question_id";
        // testMap2["fact_answer"]="question_id";
        testMap2["is_signed"]=0;
        
       testList.add(testMap2);
     }
 
     print(testList);
      print(testList[0]['question_id']);
     print("**********************************");
    }
    cacheQuestionData(){//缓存所有试题数据
         //获取单元ID List
          var unitIdList=noticeResult['ques_list'].keys.toList(); 
          questionsResult=" 所有试题数据(${unitIdList.length}) :  ";
          //=========== 获取所有试题 =========
          for(int i=0;i<unitIdList.length;i++){
              
              String unitId=unitIdList[i];
              var  questionsList=noticeResult['ques_list'][unitId]; 
              var questions = convert.jsonEncode(questionsList); 
              postQuestionApi(unitId, questions).then((val){
                  print(" ======================= start ");
                   print(val['data']['questions']);
                  //******************************* 
                  questionsResult+="#############################试题： ${i}    /r/n "+val['data']['questions'].toString()+ "#############################";
                  //******************************* 
                  print(" ======================= end ${i}");
                 
              });
            
          }
      

    }
   
     Future cacheData() async{//信息确认后
     
     Future.delayed(const Duration(seconds:2), () => print('2秒后在Event queue中运行的Future'));

     Future.delayed(const Duration(seconds:2), () {
       print('2秒后在Event queue中运行的Future');
     });


         new Future((){
              postLoginApi();
              print('################   LoginApi(); #######################' );
          })
          .then((_)  {
             Future.delayed(const Duration(seconds:1), () {
                    print('####################### 1秒后再 获取数据 notice/unit #######################'); 
                    postNoticeApi(); 
                    postUnitApi();
            });
         
        })
          .then((_)  {
                Future.delayed(const Duration(seconds:2), () {
                   print('################  2秒后再 获取数据 所有试题信息 #######################' );
                   cacheQuestionData();
            });
          
        });
    //====================
      //  FormData formData = new FormData.from({
      //      "idcard":int.parse(idcard),
      //      "cand_id":candId,
      //   });
     
      //     var a1= Future(()=> print('task'))
      //     .then((_)=> print('##################callback1'))
      //     .then((_) async{
      //      await tool.getLocalPath();
      //       Future.delayed(const Duration(seconds:2), () => print('2秒后在Event queue中运行的Future'));  
      //     })
      //      .then((_) async{
      //           Future.delayed(const Duration(seconds:1), () => print('1秒后在Event queue中运行的Future'));    
      //     })
      //     .then((_)=> print('#############callback2'));
          
      //     a1.then((m){
      //           print(" ========= m 信息确认后 ==============  ");      
      //     });
          

          
  }
 
 Future asyncTest() async{//异步测试
        //  postLoginApi().then((m){
        //    print(" =========  信息确认后 ==============  ");
        //  });
       //  Future.then(postLoginApi()).then(postUnitApi());
        //  Future.then(funA(),onError: (e) { handleError(e); }).then(funB(),onError: (e) { handleError(e); })
        List a=loginResult;
  Future.delayed(const Duration(seconds:1), () => print('1秒后在Event queue中运行的Future'));
          Future(() => print('立刻在Event queue中运行的Future'));

            Future((){
                  print(" =========  信息确认后 ==============  ");
            }); 
          Future.microtask(() => print('在Microtask queue里运行的Future'));
          Future.sync(() => print('同步运行的Future'));
          print("=========================");

         var a1= Future(()=> print('task'))
          .then((_)=> print('callback1'))
          .then((_){
              postLoginApi();
          })
          .then((_)=> print('callback2'));
          
          a1.then((m){
                print(" ========= m 信息确认后 ==============  ");      
          });
          
          
        Future(()=> throw 'we have a problem')
          .then((_)=> print('task'+a.toString()))
          .then((_)=> print('callback2'))
          .catchError((error)=>print('$error'));
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