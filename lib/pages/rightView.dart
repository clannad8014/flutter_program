import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provide/provide.dart'; 
import '../provide/showView.dart';
 
class rightView extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: ListView(
        children: <Widget>[
              Provide<SwitchView>(
              builder: (context, child, val) {
                return  Text(
                  '  ${val.index}',
                  style: Theme.of(context).textTheme.display1, 
                );
               
              },
            ),          
            _candidateInformations()
        ],
      ),
    );
  }
   //用户头像 尺寸,间距
   double candidateImageWidth=120;
   double candidateImageHeight=150;
   double candidateImageLeftPadding=80;
   double candidateImageTopPadding=20;
   double candidateImageRightPadding=10;
   double candidateImageBottomPadding=10;
   //用户姓名 size,color
   double candidateNameSize=20;
   Color candidateNameColor=Color.fromRGBO(7, 7, 7,1);
   //用户信息列表 
   double candidateListLeftPadding=40;
   double candidateListTopPadding=100;
   double candidateListRightPadding=60;
   double candidateListBottomPadding=10;
   String admissionTitleText="准考证号:";
   double admissionTitleSize=20;
   Color admissionTitleColor=Color.fromRGBO(177,177, 177,1);
   double admissionTitlePadding=20;
   String idTitleText="身份证号:";
   double idTitleSize=20;
   Color idTitleColor=Color.fromRGBO(177,177, 177,1);
   String examTitleText="试卷名称:";
   double examTitleSize=20;
   Color examTitleColor=Color.fromRGBO(177,177, 177,1);
   //左侧分割线
    Color leftLineColor=Color.fromRGBO(214, 214, 214,1);
 //考试须知内容
   double examNotesTitleSize=25;
   double examNotesTextSize=20;
   double examNotesTextPadding=10;
   //title ,text,虚线 颜色
   Color examNotesTitleColor=Color.fromRGBO(21,21, 21,1);
   Color examNotesTextColor=Color.fromRGBO(0,0, 0,1);
   Color examNotesLineColor=Color.fromRGBO(233, 233, 233, 1);

      //考生考试信息(准考证号，身份证号，试卷名称)
      Widget _candidateInformations(){
          return Container(
              padding: EdgeInsets.fromLTRB(
                  ScreenUtil().setWidth(candidateListLeftPadding),
                  ScreenUtil().setHeight(candidateListTopPadding), 
                  ScreenUtil().setWidth(candidateListRightPadding),
                  ScreenUtil().setHeight(candidateListBottomPadding)),
              child: Container(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(admissionTitleText,style: TextStyle(color: admissionTitleColor,fontSize:ScreenUtil().setSp(admissionTitleSize) ),),
                      Text("2342342342",style: TextStyle(color: admissionTitleColor,fontSize:ScreenUtil().setSp(admissionTitleSize) ),),
                       Padding(//分割线
                        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(0),ScreenUtil().setHeight(5), 
                        ScreenUtil().setWidth(0),ScreenUtil().setHeight(admissionTitlePadding)),
                        child:Container(height: ScreenUtil().setSp(2.0), color: leftLineColor,),
                      ),
                      Text(idTitleText,style: TextStyle(color: idTitleColor,fontSize:ScreenUtil().setSp(idTitleSize) ),),
                      Text("11012198712130932",style: TextStyle(color: idTitleColor,fontSize:ScreenUtil().setSp(idTitleSize) ),),
                      Padding(
                        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(0),ScreenUtil().setHeight(5), 
                        ScreenUtil().setWidth(0),ScreenUtil().setHeight(admissionTitlePadding)),
                        child:Container(height: ScreenUtil().setSp(2.0), color: leftLineColor,),
                      ),
                      Text(examTitleText,style: TextStyle(color: examTitleColor,fontSize:ScreenUtil().setSp(examTitleSize) ),),
                      Text("全国统一笔试试卷信息技术管理类",style: TextStyle(color: examTitleColor,fontSize:ScreenUtil().setSp(examTitleSize) ),),
                    ],
                  )
              )
          );
      }
   
      Widget _ExamNotesContent(){
        return ListView(
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    Text("考试须知",style: TextStyle(color:examNotesTitleColor,fontSize: ScreenUtil().setSp(examNotesTitleSize),fontWeight: FontWeight.w500 ),
                     ),
                     SizedBox(height: ScreenUtil().setHeight(10),),
                    Text(' 　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　',
                style: new TextStyle(
                        decoration: TextDecoration.overline,
                        decorationStyle: TextDecorationStyle.dashed,
                        fontSize: ScreenUtil().setSp(25),
                        fontStyle: FontStyle.italic,
                        color: examNotesLineColor
                      ),
                    ),
                  ],
                )
              ),
           
              Text("一. 关于网络",style: TextStyle(color:examNotesTextColor,fontSize: ScreenUtil().setSp(examNotesTextSize),fontWeight: FontWeight.w500 ),
            ),
            Text("请确保您网络稳定，最好有固定站稳请确保您网络稳定， 最好有固定站稳有固定站稳请确保您网络稳定。",
            style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(examNotesTextSize),fontWeight: FontWeight.w400 ),
            ),
            SizedBox(height:ScreenUtil().setHeight(examNotesTextPadding) ,),

            Text("二. 关于时间",style: TextStyle(color:examNotesTextColor,fontSize: ScreenUtil().setSp(examNotesTextSize),fontWeight: FontWeight.w500 ),
            ),
            Text("请确保您网络稳定，最好有固定站稳请确保您网络稳定， 最好有固定站稳有固定站稳请确保您网络稳定最好有固 定站稳请确保您网络稳定，最好有固定站稳。",
            style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(examNotesTextSize),fontWeight: FontWeight.w400 ),
            ),
            SizedBox(height:ScreenUtil().setHeight(examNotesTextPadding) ,),

              Text("三. 关于结果",style: TextStyle(color:examNotesTextColor,fontSize: ScreenUtil().setSp(examNotesTextSize),fontWeight: FontWeight.w500 ),
            ),
            Text("请确保您网络稳定，最好有固定站稳请确保您网络稳定 最好有固定站稳有固定站稳请确保您网络占位稳定，占位 文字。",
            style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(examNotesTextSize),fontWeight: FontWeight.w400 ),
            ),
            Text("四. 关于诚信",style: TextStyle(color:examNotesTextColor,fontSize: ScreenUtil().setSp(examNotesTextSize),fontWeight: FontWeight.w500 ),
            ),
            Text("请确保您网络稳定，最好有固定站稳请确保您网络稳定， 最好有固定站稳有固定站稳请确保您网络稳定最好有固 定站稳请确保您网络稳定，最好有固定站稳。",
            style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(examNotesTextSize),fontWeight: FontWeight.w400 ),
            ),
            SizedBox(height:ScreenUtil().setHeight(examNotesTextPadding) ,),
            
              Text("五. 关于隐私",style: TextStyle(color:examNotesTextColor,fontSize: ScreenUtil().setSp(examNotesTextSize),fontWeight: FontWeight.w500 ),
            ),
            Text("请确保您网络稳定，最好有固定站稳请确保您网络稳定， 最好有固定站稳有固定站稳请确保您网络稳定最好有固 定站稳请确保您网络稳定，最好有固定站稳。",
            style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(examNotesTextSize),fontWeight: FontWeight.w400 ),
            ),
            SizedBox(height:ScreenUtil().setHeight(examNotesTextPadding) ,),
            
              Text("六. 关于版权",style: TextStyle(color:examNotesTextColor,fontSize: ScreenUtil().setSp(examNotesTextSize),fontWeight: FontWeight.w500 ),
            ),
            Text("请确保您网络稳定，最好有固定站稳请确保您网络稳定， 最好有固定站稳有固定站稳请确保您网络稳定最好有固 定站稳请确保您网络稳定，最好有固定站稳。",
            style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(examNotesTextSize),fontWeight: FontWeight.w400 ),
            ),
            ],
          );
    }
 

}//

 