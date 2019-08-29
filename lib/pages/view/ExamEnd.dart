import 'package:flutter/material.dart';
import '../../res/flutter_screenutil.dart';
/**
 * 考试结束
 */

class ExamEnd extends StatefulWidget {
  ExamEnd({Key key}) : super(key: key);

  _ExamEndState createState() => _ExamEndState();
}

class _ExamEndState extends State<ExamEnd> {
  @override
   Widget build(BuildContext context) {
      ScreenUtil.instance = ScreenUtil(width: 752, height:1280)..init(context);
      // TODO: implement build
      return Scaffold(
         body:  Container(
        decoration: BoxDecoration(
        color: Color.fromRGBO(242,242, 242, 1),
        ),
       child: Column(
           children: <Widget>[
                 Padding(
                  padding: EdgeInsets.all(0),
                   child: Container(
                    // width: ScreenUtil().setWidth(750),
                     height: ScreenUtil().setHeight(68),
                   ),
                 ),
            SizedBox(height: ScreenUtil().setHeight(88),),
            Image(
                image: AssetImage("images/end.png"),
                width: ScreenUtil().setWidth(750),
                height: ScreenUtil().setHeight(650),
                  ),
             SizedBox(height: ScreenUtil().setHeight(20) ),
             Container(
               width: ScreenUtil().setWidth(750),
               height:ScreenUtil().setHeight(235),
               color: Colors.white,
               child: Column(
                  children: <Widget>[
                       Row(
                    children: [  
                      Padding(
                        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(69), ScreenUtil().setHeight(32), 
                        ScreenUtil().setWidth(0),ScreenUtil().setHeight(25)),
                        child: Text(
                        '考生姓名',
                        style:  TextStyle(color: Colors.black,fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(32),),
                                ),
                            ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(392), ScreenUtil().setHeight(32), 
                        ScreenUtil().setWidth(45),ScreenUtil().setHeight(25)),
                        child: Text(
                        '张冰冰',
                        style:  TextStyle(color: Colors.black,fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(32),),
                                ),
                            ),
                   ],
                  ),
                    Padding(
                     padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(26),0, 
                        ScreenUtil().setWidth(24),0),
                       child:Container(width: ScreenUtil().setWidth(700), height: 2.0, color: Color(0xFFF3F3F3),),
                  ),
                          Row(
                    children: [  
                      Padding(
                        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(69), ScreenUtil().setHeight(32), 
                        ScreenUtil().setWidth(0),ScreenUtil().setHeight(25)),
                        child: Text(
                        '考试成绩',
                        style:  TextStyle(color: Colors.black,fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(32),),
                                ),
                            ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(417), ScreenUtil().setHeight(32), 
                        ScreenUtil().setWidth(45),ScreenUtil().setHeight(25)),
                        child: Text(
                        '98分',
                        style:  TextStyle(color: Colors.black,fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(32),),
                                ),
                            ),
                   ],
                  ),
                  ],
               ),

             ),

            ]
       )
       )
       );
  }

}
