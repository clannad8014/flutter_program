import 'package:flutter/material.dart';
import '../../res/flutter_screenutil.dart';
import 'CandidateInstruction.dart';

/**
 * 信息确认页面
 */
class ConfirmInformation extends StatefulWidget {
  ConfirmInformation({Key key}) : super(key: key);

  _ConfirmInformationState createState() => _ConfirmInformationState();
}

class _ConfirmInformationState extends State<ConfirmInformation> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 752, height:1280)..init(context);
    return Scaffold(
         body:  Column(
             crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(0),
                   child: Container(
                     width: ScreenUtil().setWidth(750),
                     height: ScreenUtil().setHeight(100),
                     color: Color.fromRGBO(242,242, 242, 1),
                   ),
                 ),

                Container(
                  color: Color.fromRGBO(255,255,255,0.7),
                  width: double.infinity,
                  height: ScreenUtil().setHeight(50),
                  child: Align(
                      alignment: Alignment.center,
                      child:  Text('国家电网公司2019秋季校园招聘考试',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36),fontWeight: FontWeight.w400 ) ,                     
                            ),
                  )
                ),
                Container(
                    width: ScreenUtil().setWidth(750),
                    height: ScreenUtil().setHeight(28),
                    color: Color.fromRGBO(242,242, 242, 1),
                  ),
               
                Padding(
                   padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(254), ScreenUtil().setHeight(48), 
                   ScreenUtil().setWidth(254),ScreenUtil().setHeight(46)),
                   child: Container(
                     height: ScreenUtil().setHeight(400),
                       decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/test.png"),
                              fit: BoxFit.cover,
                            ),
                          )
                   ),
                 ),
               
                Container(
                  width: ScreenUtil().setWidth(750),
                  height: ScreenUtil().setHeight(20),
                  color: Color.fromRGBO(242,242, 242, 1),
                ),
        
                Container(
                  padding:  EdgeInsets.all(0.0),
                  child:  Column(
                    children: [  
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
                          '准考证号',
                          style:  TextStyle(color: Colors.black,fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(32),),
                                  ),
                              ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(252), ScreenUtil().setHeight(32), 
                          ScreenUtil().setWidth(45),ScreenUtil().setHeight(25)),
                          child: Text(
                          '1000298399882',
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
                        ScreenUtil().setWidth(0),ScreenUtil().setHeight(30)),
                        child: Text(
                        '开考时间',
                        style:  TextStyle(color: Colors.black,fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(32),),
                                ),
                            ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(322), ScreenUtil().setHeight(32), 
                        ScreenUtil().setWidth(45),ScreenUtil().setHeight(25)),
                        child: Text(
                        '2019-08-25',
                        style:  TextStyle(color: Colors.black,fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(32),),
                                ),
                            ),
                    ],
                  ),
                  Container(
                    width: ScreenUtil().setWidth(750),
                    height: ScreenUtil().setHeight(250),
                    //height: double.infinity,
                    color: Color.fromRGBO(242,242, 242, 1),
                    padding: EdgeInsets.fromLTRB(0,ScreenUtil().setHeight(100),0,0),
                    child:  Row(
                      children: <Widget>[
                        SizedBox(width:ScreenUtil().setWidth(68) ),
                        SizedBox(
                          width:ScreenUtil().setWidth(248) ,
                          height: ScreenUtil().setHeight(88),
                          child: Material(
                            child:  RaisedButton(
                              onPressed: () {
                                  //跳转考生须知
                                  // Navigator.push(context,
                                  // MaterialPageRoute(builder: (context) => CandidateInstruction()));
                                  Navigator.pushNamed(context, '/CandidateInstruction');    
                              },
                              color: const Color.fromRGBO(73, 157, 241,1),
                              child:  Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: ScreenUtil().setWidth(32),
                                    height: ScreenUtil().setWidth(20),
                                  ),
                                  Image(
                                    image: AssetImage("images/true.png"),
                                    width: ScreenUtil().setWidth(32),
                                    height: ScreenUtil().setHeight(26),
                                  ),
                                  Text(" 正确",style: TextStyle( fontSize:ScreenUtil().setSp(32) ,color: Colors.white),),
                                ],
                              )
                                    ),

                                borderRadius: BorderRadius.circular(40.0),
                          
                          )
                        ),
                        SizedBox(width:ScreenUtil().setWidth(116) ),
                        SizedBox(
                          width:ScreenUtil().setWidth(248) ,
                          height: ScreenUtil().setHeight(88),
                          child: Material(
                            child:  RaisedButton(
                              onPressed: () {
                              },
                              color: const Color.fromRGBO(216,216,216,1),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: ScreenUtil().setWidth(32),
                                    height: ScreenUtil().setWidth(20),
                                  ),
                                  Image(
                                    image: AssetImage("images/false.png"),
                                    width: ScreenUtil().setWidth(32),
                                    height: ScreenUtil().setHeight(26),
                                  ),
                                  Text(" 错误",style: TextStyle( fontSize:ScreenUtil().setSp(32) ,color: Colors.white),),
                                ],
                              )
                                    ),
                                borderRadius: BorderRadius.circular(40.0),
                          
                          )
                        ),
                      ],
                    ),
                    ),
                
                    ],
                  ),
              ),
           
           ],
    
      ),

     
      ) ;
  }
}