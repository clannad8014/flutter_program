import 'package:flutter/material.dart';
import 'package:program/pages/view/Exam.dart';
import 'package:program/pages/view/ExamEnd.dart';
import 'package:program/pages/view/SelectType.dart';
import '../../res/flutter_screenutil.dart';
/**
 * 选择试题
 */
class SelectTest extends StatefulWidget {
  SelectTest({Key key}) : super(key: key);

  _SelectTestState createState() => _SelectTestState();
}

class _SelectTestState extends State<SelectTest> {
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
                     height: ScreenUtil().setHeight(86),
                   ),
                 ),
                SizedBox(width: ScreenUtil().setWidth(50),),
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
                   padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(46), ScreenUtil().setHeight(28),
                      ScreenUtil().setWidth(44), ScreenUtil().setHeight(38)),
                   child: Container(
                     width: ScreenUtil().setWidth(660),
                     height: ScreenUtil().setHeight(200),
                          decoration: new BoxDecoration(
                          border: new Border.all(color: Color.fromRGBO(233,233,233,1), width: 1),                       
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height:  ScreenUtil().setHeight(28)),
                            Row(
                              children: <Widget>[
                                SizedBox(width:  ScreenUtil().setWidth(70)),
                             Text('本次考试包含',
                                style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(32),fontWeight: FontWeight.w400 ) ,                     
                              ),
                            Text('5',
                                style: TextStyle(color:Color.fromRGBO(0, 0, 0, 1) ,fontSize: ScreenUtil().setSp(32),fontWeight: FontWeight.w400 ) ,                     
                            ),
                            Text('个模块，总时长',
                                style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(32),fontWeight: FontWeight.w400 ) ,                     
                              ),
                            Text('60',
                             style: TextStyle(color:Color.fromRGBO(0, 0, 0, 1) ,fontSize: ScreenUtil().setSp(32),fontWeight: FontWeight.w400 ) ,                     
                            ),
                              Text('分钟',
                             style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(32),fontWeight: FontWeight.w400 ) ,                     
                              ),

                              ],
                            ),
                           
                            SizedBox(height:  ScreenUtil().setHeight(35)),
                            Text('00:58:44',
                      style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(56),fontWeight: FontWeight.w500 ) ,                     
                              ),
                          
                          ],
                        ),
                   ),
                  ),
                  
                   BuildRow(context,"能力测试","智力测试",0),
                   SizedBox(height: ScreenUtil().setHeight(30),  ),
                   BuildRow(context,"行为测试","性格测试",0),
                   SizedBox(height: ScreenUtil().setHeight(30),  ),
                   BuildRow(context,"逻辑测试","语言测试",100),
                   SizedBox(height: ScreenUtil().setHeight(40),  ),
                   ButtonInform(context),
                 
            ]      
             )
           )
         ); 
      }
      
      @override
      Widget BuildRow(BuildContext context,String title_1,String title_2,int n){
      
        return Row(
           children: <Widget>[
             SizedBox(width: ScreenUtil().setWidth(46),),
                  
              Container(
                width: ScreenUtil().setWidth(308),
                height: ScreenUtil().setHeight(200),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                  image: new AssetImage('images/div_bg.png'), 
                  fit: BoxFit.cover// 填满
                  ),
                  
                ),
                  child:  GestureDetector(
                      onTap: (){
                           Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context)=>Exam()
                            )
                        );
                      },
                     child: Column(
                    children: <Widget>[
                      SizedBox( height: ScreenUtil().setHeight(30),),
                      Text(title_1,
                            style: TextStyle(color:Color.fromRGBO(0,0,0,1) ,fontSize: ScreenUtil().setSp(38),fontWeight: FontWeight.w400 ),
                            ),
                      SizedBox( height: ScreenUtil().setHeight(50),),      
                      Row(
                        children: <Widget>[
                          SizedBox( width: ScreenUtil().setWidth(42),),
                            Text("共100道",
                            style: TextStyle(color:Color.fromRGBO(155,155,155,1) ,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w400 ),
                            ),
                            SizedBox( width: ScreenUtil().setWidth(12),),
                              Text("已答100道",
                            style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w400 ),
                            ),
                        ],
                      )
                    ],
                  )
                      ),
                   
          
              ),
               SizedBox(width: ScreenUtil().setWidth(42),),
               Container(
                width: ScreenUtil().setWidth(308),
                height: ScreenUtil().setHeight(200),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                  image: new AssetImage('images/div_bg.png'), 
                  fit: BoxFit.cover// 填满
                  ),
                  
                ),
                  child: GestureDetector(
                      onTap: (){
                          Navigator.push<Object>(context,   MaterialPageRoute(
                                builder: (BuildContext context) {   return  SelectType();
                                },
                            ),
                          );
                      },
                     child: Column(
                    children: <Widget>[
                      SizedBox( height: ScreenUtil().setHeight(30),),
                      Text(title_2,
                            style: TextStyle(color:Color.fromRGBO(0,0,0,1) ,fontSize: ScreenUtil().setSp(38),fontWeight: FontWeight.w400 ),
                            ),
                      SizedBox( height: ScreenUtil().setHeight(50),),      
                      Row(
                        children: <Widget>[
                          SizedBox( width: ScreenUtil().setWidth(42),),
                            Text("共100道",
                            style: TextStyle(color:Color.fromRGBO(155,155,155,1) ,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w400 ),
                            ),
                            SizedBox( width: ScreenUtil().setWidth(12),),
                              Text("已答100道",
                            style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w400 ),
                            ),
                        ],
                      )
                    ],
                  )
                      ),
              )
              
            ],
        );
            
      }
      Widget ButtonInform(BuildContext context){
        return Padding(
          padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(36), ScreenUtil().setHeight(45), 
          ScreenUtil().setWidth(34), ScreenUtil().setHeight(0)),
          child: SizedBox(
              width:ScreenUtil().setWidth(680) ,
              height: ScreenUtil().setHeight(58),
              child: Material(
                  child:  RaisedButton(
                      onPressed: () {
                        // Navigator.push<Object>(context,   MaterialPageRoute(
                        //         builder: (BuildContext context) {   return  ExamEnd();
                        //         },
                        //     ),
                        // );
                       
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context)=>ExamEnd()
                            )
                            );
                      },
                      color: const Color.fromRGBO(73,157,241,1),
                      child:    Text(" 我要交卷",style: TextStyle( fontSize:ScreenUtil().setSp(32) ,color: Colors.white),),
                    
                        ),
                borderRadius: BorderRadius.circular(40.0),
                
                )
              ),
            );
      }
  }
