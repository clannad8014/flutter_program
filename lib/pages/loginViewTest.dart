import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:program/provide/loginPost.dart';
import 'package:provide/provide.dart';

import '../provide/showView.dart';
import '../provide/loginPost.dart';
import '../provide/readNoticeData.dart';
import '../provide/readQuestionData.dart';
import '../provide/timerDown.dart';
import '../provide/readLocalData.dart';
//view
import './midView.dart';
import './rightView.dart';
class ShowTestView extends StatelessWidget {
  const ShowTestView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        // title: Text('购物车'),
         
      ),
      body:Container(
         child: Row(
           children: <Widget>[
             _leftView(context),
             SizedBox(width:20),
             _midView(),
             SizedBox(width:20),
             _rightView(),
           ],
         ),
      )
    );
  }
  
  Widget postButton(int index,context){
    var a=  RaisedButton(
            onPressed: (){
                Provide.value<LoginPost>(context).postLoginApi();
            },
            child: Text("登录"),
          );
    var b=  RaisedButton(
            onPressed: (){
                //  Provide.value<ReadLocalData>(context).readData("10000456","noticeData","notice");
                //  Provide.value<ReadLocalData>(context).readData("10000456","loginData","login");
                //  Provide.value<ReadLocalData>(context).readData("10000456","unitData","unit");
                 Provide.value<ReadLocalData>(context).readData("10000456","questionsData","5C9AD002-1C64-3842-430E-09362094F96C");
            },
            child: Text("获取信息信息"),
          );
    var c=  RaisedButton(
            onPressed: (){
                Provide.value<ReadQuestionData>(context).readQuestion("10000456","questionsData","5C9AD002-1C64-3842-430E-09362094F96C");
            },
            child: Text("获取试题信息"),
          );
        if(index==2){ return b;}
        else if(index==3){ return c;}
        else{return a;}
  }
  Widget resData(int index){
     var a=Provide<LoginPost>(
              builder: (context, child, val) {
               var aa= Container(
               height: 300,
               color: Colors.greenAccent[100],
               child: Text(" ${val.loginResult} ")
                );
                 if(val.loginResult.toString().length<6){ return Text("login信息加载中。。。。。");}
                 else{return aa;}
                // return Text("加载中。。。。。");
              }
               );         
    var b=Provide<ReadLocalData>(
          builder: (context, child, val) {
            var bb= Container(
            height: 300,
             color: Colors.greenAccent[200],
            child: Text(" ${val.resData.toString()} ")
            );
              if(val.resData.toString().length<6){ return Text("  信息加载中。。。。。");}
              else{return bb;}
            // return Text("加载中。。。。。");
          }
            ); 
        var c=Provide<ReadQuestionData>(
          builder: (context, child, val) {
            var cc= Container(
            height: 300,
             color: Colors.greenAccent[300],
            child: Text(" ${val.questionData.toString()} ")
            );
              if(val.questionData.toString().length<6){ return Text("questionData  信息加载中。。。。。");}
              else{return cc;}
            // return Text("加载中。。。。。");
          }
            ); 
            if(index==2){ return b;}
            else if(index==3){ return c;}
            else  { return a;}         
  }
  Widget _leftView(context){
     return Container(
        width: 400,
        color: Colors.blue[50],
        child: ListView(
           children: <Widget>[
             RaisedButton(
               onPressed: (){
                Provide.value<SwitchView>(context).changeIndex(1);
               },
               child: Text("切换1"),
             ),
           
                RaisedButton(
                onPressed: () {
                Provide.value<SwitchView>(context).changeIndex(2);
              },
                  child: Text('切换2'),
                ),
              RaisedButton(
              onPressed: () {
                Provide.value<SwitchView>(context).changeIndex(3);
              },
                  child: Text('切换3'),
                ),
      
              Provide<SwitchView>(
              builder: (context, child, val) {
                var a= Container(
                    height: 300,
                    color: val.index==2?Colors.blue[100] :Colors.blue[200],
                    child: ListView(
                      children: <Widget>[
                          Text(
                          '  ${val.index}',
                          style: Theme.of(context).textTheme.display1,
                        ), 
                       postButton(val.index,context),
                       resData(val.index),
                      ],
                    )
                  );
       
                if(val.index==1){ return a;}
                else if(val.index==2){ return a;}
                else if(val.index==3){ return a;}
                else{ return a;}
              },
            ),                  
              //  Provide<LoginPost>(
              // builder: (context, child, val) {
              //  var a= Container(
              //  height: 300,
              //  color: Colors.amberAccent[200],
              //  child: Text(" ${val.loginResult} ")
              //   );
              //    if(val.loginResult.toString().length<6){ return Text("加载中。。。。。");}
              //    else{return a;}
              //   // return Text("加载中。。。。。");
              // }
              //  ),               
           ],
        ),
     );
  }
   Widget _midView(){
        return Container(
        width: 400,
        color: Colors.green[50],
        child: ListView(
           children: <Widget>[
             Provide<SwitchView>(
              builder: (context, child, val) {
              var a=Container(
                    height: 300,
                    color: val.index==2?Colors.purple[100] :Colors.red[100],
                    child:   Text(
                        '  ${val.index}',
                        style: Theme.of(context).textTheme.display1,
                      ),
                  );
                
                var b=Container(
                    height: 300,
                    color: val.index==2?Colors.purple[100] :Colors.red[100],
                    child:  ListView(
                      children: <Widget>[
                        midView()
                      ],
                    )
                  );
                if(val.index==1){
                    return b;
                }else{  return a;}
              },
            ),     
           ],
        ),
     );
  }
   Widget _rightView(){
        return Container(
        width: 400,
        color: Colors.orange[50],
        child: ListView(
           children: <Widget>[
             Container(
               height: 300,
               color: Colors.blue[100],
             ),
               Provide<SwitchView>(
              builder: (context, child, val) {
               var a=  Container(
                    height: 300,
                    color: val.index==2?Colors.yellow[100] :Colors.orange[100],
                    child:   Text(
                        '  ${val.index}',
                        style: Theme.of(context).textTheme.display1,
                      ),
                  );
                    var b=Container(
                        height: 300,
                        color: val.index==2?Colors.purple[100] :Colors.red[100],
                        child:  ListView(
                          children: <Widget>[
                            rightView()
                          ],
                        )
                      );
                    if(val.index==1){
                        return b;
                    }else{  return a;}
              },
            ),     
           ],
        ),
     );
  }
}