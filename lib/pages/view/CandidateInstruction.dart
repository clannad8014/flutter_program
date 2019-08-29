import 'package:flutter/material.dart';
import '../../res/flutter_screenutil.dart';
import 'SelectTest.dart';
/**
 * 考生须知页面
 */
class CandidateInstruction extends StatefulWidget {
  CandidateInstruction({Key key}) : super(key: key);

  _CandidateInstructionState createState() => _CandidateInstructionState();
}

class _CandidateInstructionState extends State<CandidateInstruction> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 752, height:1280)..init(context);
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
                     height: ScreenUtil().setHeight(80),
                   ),
                 ),
                  Container(
                      color: Color.fromRGBO(255,255,255,0.7),
                      width: double.infinity,
                      height: ScreenUtil().setHeight(100),
                      child: Align(
                         alignment: Alignment.center,
                         child:  Text('国家电网公司2019秋季校园招聘考试',
                        style: TextStyle(fontSize: ScreenUtil().setSp(36),fontWeight: FontWeight.w400 ) ,                     
                                ),
                      )
                    ),
                  Padding(
                        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(36), ScreenUtil().setHeight(28), 
                        ScreenUtil().setWidth(34), ScreenUtil().setHeight(0)),
                              child: Container(
                              width: ScreenUtil().setWidth(680),
                              height: ScreenUtil().setHeight(844),
                              color: Color.fromRGBO(255,255,255,1),
                              child:Padding(
                                  padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(32), ScreenUtil().setHeight(0), 
                            ScreenUtil().setWidth(28), ScreenUtil().setHeight(0)),
                              child: Container(
                                  child:ListView(
                                      children: <Widget>[
                                      Text("一. 关于网络",style: TextStyle(color:Color.fromRGBO(0,0,0,1) ,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w500 ),
                                      ),
                                      Text("请确保您网络稳定，最好有固定站稳请确保您网络稳定， 最好有固定站稳有固定站稳请确保您网络稳定。",
                                      style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w400 ),
                                      ),
                                      SizedBox(height:ScreenUtil().setHeight(24) ,),

                                      Text("二. 关于时间",style: TextStyle(color:Color.fromRGBO(0,0,0,1) ,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w500 ),
                                      ),
                                      Text("请确保您网络稳定，最好有固定站稳请确保您网络稳定， 最好有固定站稳有固定站稳请确保您网络稳定最好有固 定站稳请确保您网络稳定，最好有固定站稳。",
                                      style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w400 ),
                                      ),
                                      SizedBox(height:ScreenUtil().setHeight(24) ,),

                                        Text("三. 关于结果",style: TextStyle(color:Color.fromRGBO(0,0,0,1) ,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w500 ),
                                      ),
                                      Text("请确保您网络稳定，最好有固定站稳请确保您网络稳定 最好有固定站稳有固定站稳请确保您网络占位稳定，占位 文字。",
                                      style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w400 ),
                                      ),
                                      Text("四. 关于诚信",style: TextStyle(color:Color.fromRGBO(0,0,0,1) ,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w500 ),
                                      ),
                                      Text("请确保您网络稳定，最好有固定站稳请确保您网络稳定， 最好有固定站稳有固定站稳请确保您网络稳定最好有固 定站稳请确保您网络稳定，最好有固定站稳。",
                                      style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w400 ),
                                      ),
                                      SizedBox(height:ScreenUtil().setHeight(24) ,),
                                      
                                        Text("五. 关于隐私",style: TextStyle(color:Color.fromRGBO(0,0,0,1) ,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w500 ),
                                      ),
                                      Text("请确保您网络稳定，最好有固定站稳请确保您网络稳定， 最好有固定站稳有固定站稳请确保您网络稳定最好有固 定站稳请确保您网络稳定，最好有固定站稳。",
                                      style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w400 ),
                                      ),
                                      SizedBox(height:ScreenUtil().setHeight(24) ,),
                                      
                                        Text("六. 关于版权",style: TextStyle(color:Color.fromRGBO(0,0,0,1) ,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w500 ),
                                      ),
                                      Text("请确保您网络稳定，最好有固定站稳请确保您网络稳定， 最好有固定站稳有固定站稳请确保您网络稳定最好有固 定站稳请确保您网络稳定，最好有固定站稳。",
                                      style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w400 ),
                                      ),
                                      ],
                                    ),
                                  
                              )
                              )
                            ),
                    ),
                  Padding(
                       padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(68), ScreenUtil().setHeight(22), 
                        ScreenUtil().setWidth(34), ScreenUtil().setHeight(0)),
                        child:Row(
                          children: <Widget>[
                            // Checkbox(
                            //   value: true,
                            //  activeColor: Colors.blue,
                            //  //onChanged:(){},
                            //  ),
                             Text('□ 已认真阅读完考生须知',
                        style: TextStyle(color:Color.fromRGBO(155,155,155,1),fontSize: ScreenUtil().setSp(24),fontWeight: FontWeight.w500 ) ,                     
                                ),
                              
                          ],
                        ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(36), ScreenUtil().setHeight(45), 
                    ScreenUtil().setWidth(34), ScreenUtil().setHeight(0)),
                    child: SizedBox(
                        width:ScreenUtil().setWidth(680) ,
                        height: ScreenUtil().setHeight(88),
                        child: Material(
                            child:  RaisedButton(
                                onPressed: () {
                                  //  Navigator.push(context,
                                  //  MaterialPageRoute(builder: (context) => SelectTest()));
                                   Navigator.pushNamed(context, '/SelectTest'); 
                                },
                                color: const Color.fromRGBO(73,157,241,1),
                                child:    Text(" 进入考试",style: TextStyle( fontSize:ScreenUtil().setSp(32) ,color: Colors.white),),
                              
                                  ),
                          borderRadius: BorderRadius.circular(40.0),
                          
                          )
                        ),
                      )
           ],
         )
         )
         );
  }
}