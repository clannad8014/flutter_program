import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

 
class midView extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          
              _candidateInformation(),
              //  _candidateInformations()

        ],
      ),
    );
  }
   //用户头像 尺寸,间距
   double candidateImageWidth=220;
   double candidateImageHeight=450;
   double candidateImageLeftPadding=10;
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

       //考生信息(头像，名称)
      Widget _candidateInformation(){
          return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(//用户头像
                    padding: EdgeInsets.fromLTRB(
                        ScreenUtil().setWidth(candidateImageLeftPadding),
                        ScreenUtil().setHeight(candidateImageTopPadding), 
                        ScreenUtil().setWidth(candidateImageRightPadding),
                        ScreenUtil().setHeight(candidateImageBottomPadding)),
                   child: Container(
                      width: ScreenUtil().setWidth(candidateImageWidth),
                      height: ScreenUtil().setHeight(candidateImageHeight),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566121934344&di=1dcee8e285bd91caf84468b52182ad61&imgtype=0&src=http%3A%2F%2F00.minipic.eastday.com%2F20170818%2F20170818115355_d41d8cd98f00b204e9800998ecf8427e_1.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        )
                  )
                  ),
                  Center( 
                    child:   Text("新垣结衣",style: TextStyle(fontSize:ScreenUtil().setSp(candidateNameSize),color:candidateNameColor ),),
                       ),
                   _candidateInformations(),
                ],
              )
          );
      }
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
}//

   