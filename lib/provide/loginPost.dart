import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model/tools.dart';
import '../service/service_method.dart';
class LoginPost with ChangeNotifier{
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
              loginResult=valJson['data'];
            token=loginResult['token'];
            examId=loginResult['exam_id'];
            //写入本地
            tool.cacheJson("${examId}/loginData", "login", valJson);
          
            }else{
                print("##############code: ${valJson['code']} : ${valJson['message']} ###########################");
                loginResult="##############code: ${valJson['code']} : ${valJson['message']} ###########################";
            }
 

          });

        notifyListeners();
  }
  // increment(){
  //   value++;
  //   notifyListeners();//
  // }
}