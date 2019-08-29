import 'package:flutter/material.dart';
import '../../res/flutter_screenutil.dart';
import 'Exam.dart';

class SelectType extends StatefulWidget {
  SelectType({Key key}) : super(key: key);

  _SelectTypeState createState() => _SelectTypeState();
}

class _SelectTypeState extends State<SelectType> {
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
                     height: ScreenUtil().setHeight(128),
                   ),
                 ),
                 SizedBox(width: ScreenUtil().setWidth(50),),
                 Container(
                    color: Color.fromRGBO(255,255,255,0.7),
                    width: double.infinity,
                    height: ScreenUtil().setHeight(100),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child:  Row(
                        children: <Widget>[
                          SizedBox(width:  ScreenUtil().setWidth(280),),
                          Text('考试剩余时间',
                      style: TextStyle(fontSize: ScreenUtil().setSp(32),fontWeight: FontWeight.w400 ) ,                     
                              ),
                          SizedBox(width:  ScreenUtil().setWidth(70),),
                          Text('00:58:44',
                      style: TextStyle(fontSize: ScreenUtil().setSp(40),fontWeight: FontWeight.w500) ,                     
                              ),
                        ],
                      )
                    )
                  ),
                 Padding(
                  padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(0), ScreenUtil().setHeight(36),
                  ScreenUtil().setWidth(0),ScreenUtil().setHeight(42)),
                  child:Container(
                    height: ScreenUtil().setHeight(54),
                    child: ListView(
                     scrollDirection: Axis.horizontal,
                    children: <Widget>[
                     SizedBox(width: ScreenUtil().setWidth(20),),
                      Container(
                        child: new Material(
                          child: new Ink(
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                              color: Color.fromRGBO(73, 157, 241, 1),
                            ),
                            child: new InkWell(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment(0, 0),
                                    width:ScreenUtil().setWidth(160) ,
                                    height: ScreenUtil().setHeight(54),
                                  child:  Text("能力测试",style: TextStyle( fontSize:ScreenUtil().setSp(30) ,color: Colors.white),),
                                        )
                                  ),
                            ),
                          ),
                        ),
                      SizedBox(width: ScreenUtil().setWidth(20),),
                      TypeButton("智力测试"),
                      SizedBox(width: ScreenUtil().setWidth(20),),
                      TypeButton("行为测试"),
                      SizedBox(width: ScreenUtil().setWidth(20),),
                      TypeButton("性格测试"),
                      SizedBox(width: ScreenUtil().setWidth(20),),
                      TypeButton("逻辑测试"),
                      SizedBox(width: ScreenUtil().setWidth(20),),
                      TypeButton("语言测试"),
                    ],
                  )
                  )
                ),
                 Container(
                   height: ScreenUtil().setHeight(168),
                   width: double.infinity,
                   color: Color.fromRGBO(255, 255, 255, 1),
                   child: TestCount(),
                 ),
                 SizedBox(height: ScreenUtil().setHeight(14),),
                 Container(
                   height: ScreenUtil().setHeight(1080),
                   width: double.infinity,
                   color: Color.fromRGBO(255, 255, 255, 1),
                   child: ListView(
                     children: <Widget>[
                       TestList(context,"单选",Color.fromRGBO(255, 161, 105, 1),"已答",Color.fromRGBO(155, 155, 155, 1)),
                       SizedBox(height: ScreenUtil().setHeight(12),),
                       Container(
                          height: ScreenUtil().setHeight(2),
                          width: double.infinity,
                          color: Color.fromRGBO(242,242,242,1),
                       ),
                       TestList(context,"单选",Color.fromRGBO(255, 161, 105, 1),"已答",Color.fromRGBO(155, 155, 155, 1)),
                        Container(
                          height: ScreenUtil().setHeight(2),
                          width: double.infinity,
                          color: Color.fromRGBO(242,242,242,1),
                       ),
                       TestList(context,"单选",Color.fromRGBO(255, 161, 105, 1),"已答",Color.fromRGBO(155, 155, 155, 1)),
                       Container(
                          height: ScreenUtil().setHeight(2),
                          width: double.infinity,
                          color: Color.fromRGBO(242,242,242,1),
                       ),
                       TestList(context,"单选",Color.fromRGBO(255, 161, 105, 1),"未答",Color.fromRGBO(74, 74, 74, 1)),
                       Container(
                          height: ScreenUtil().setHeight(2),
                          width: double.infinity,
                          color: Color.fromRGBO(242,242,242,1),
                       ),
                       TestList(context,"多选",Color.fromRGBO(68, 166, 141, 1),"已答",Color.fromRGBO(155, 155, 155, 1)),
                       Container(
                          height: ScreenUtil().setHeight(2),
                          width: double.infinity,
                          color: Color.fromRGBO(242,242,242,1),
                       ),
                      TestList(context,"多选",Color.fromRGBO(68, 166, 141, 1),"已答",Color.fromRGBO(155, 155, 155, 1)),
                       Container(
                          height: ScreenUtil().setHeight(2),
                          width: double.infinity,
                          color: Color.fromRGBO(242,242,242,1),
                       ),
                       TestList(context,"判断",Color.fromRGBO(255, 223, 105, 1),"未答",Color.fromRGBO(74, 74, 74, 1)),
                       Container(
                          height: ScreenUtil().setHeight(2),
                          width: double.infinity,
                          color: Color.fromRGBO(242,242,242,1),
                       ),
                       TestList(context,"填空",Color.fromRGBO(77, 117, 167, 1),"未答",Color.fromRGBO(74, 74, 74, 1)),
                       Container(
                          height: ScreenUtil().setHeight(2),
                          width: double.infinity,
                          color: Color.fromRGBO(242,242,242,1),
                       ),
                        TestList(context,"填空",Color.fromRGBO(77, 117, 167, 1),"未答",Color.fromRGBO(74, 74, 74, 1)),
                       Container(
                          height: ScreenUtil().setHeight(2),
                          width: double.infinity,
                          color: Color.fromRGBO(242,242,242,1),
                       ),

                         Container(
                          height: ScreenUtil().setHeight(2),
                          width: double.infinity,
                          color: Color.fromRGBO(242,242,242,1),
                       ),
                       TestList(context,"判断",Color.fromRGBO(255, 223, 105, 1),"未答",Color.fromRGBO(74, 74, 74, 1)),
                       Container(
                          height: ScreenUtil().setHeight(2),
                          width: double.infinity,
                          color: Color.fromRGBO(242,242,242,1),
                       ),
                       TestList(context,"填空",Color.fromRGBO(77, 117, 167, 1),"未答",Color.fromRGBO(74, 74, 74, 1)),
                       Container(
                          height: ScreenUtil().setHeight(2),
                          width: double.infinity,
                          color: Color.fromRGBO(242,242,242,1),
                       ),
                        TestList(context,"填空",Color.fromRGBO(77, 117, 167, 1),"未答",Color.fromRGBO(74, 74, 74, 1)),
                       Container(
                          height: ScreenUtil().setHeight(2),
                          width: double.infinity,
                          color: Color.fromRGBO(242,242,242,1),
                       ),
                     ],
                   ),
                 ),
              
               
                 
                  
                  ]
                  )
                  )
      );
  }

    Widget TypeButton(String text){
          return  Container(
                child: new Material(
                  child: new Ink(
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      color: Color.fromRGBO(216,216,216,1),
                    ),
                    child: new InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment(0, 0),
                            width:ScreenUtil().setWidth(160) ,
                            height: ScreenUtil().setHeight(54),
                          child:  Text(text,style: TextStyle( fontSize:ScreenUtil().setSp(30) ,color: Colors.white),),
                                )
                          ),
                    ),
                  ),
                    );
    }
 
    Widget TestCount(){
      return Column(
          children: <Widget>[
            SizedBox(height: ScreenUtil().setHeight(36)),
            Row(
              children: <Widget>[
                SizedBox(width: ScreenUtil().setWidth(71),),
                Text("100道",style: TextStyle(color: Color.fromRGBO(3, 3, 3, 1), fontSize: ScreenUtil().setSp(36)),
                    ),
                SizedBox(width: ScreenUtil().setWidth(100),),
                Text("22道",style: TextStyle(color: Color.fromRGBO(3, 3, 3, 1), fontSize: ScreenUtil().setSp(36)),
                  ),
                SizedBox(width: ScreenUtil().setWidth(100),),
                Text("88道",style: TextStyle(color: Color.fromRGBO(3, 3, 3, 1), fontSize: ScreenUtil().setSp(36)),
                  ),
                SizedBox(width: ScreenUtil().setWidth(104),),
                Text("10道",style: TextStyle(color: Color.fromRGBO(3, 3, 3, 1), fontSize: ScreenUtil().setSp(36)),
                  ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(width: ScreenUtil().setWidth(60),),
                Text("单元题数",style: TextStyle(color: Color.fromRGBO(184, 184, 184, 1), fontSize: ScreenUtil().setSp(28)),
                    ),
                SizedBox(width: ScreenUtil().setWidth(94),),
                Text("已完成",style: TextStyle(color: Color.fromRGBO(184, 184, 184, 1), fontSize: ScreenUtil().setSp(28)),
                  ),
                SizedBox(width: ScreenUtil().setWidth(94),),
                Text("未完成",style: TextStyle(color: Color.fromRGBO(184, 184, 184, 1), fontSize: ScreenUtil().setSp(28)),
                  ),
                SizedBox(width: ScreenUtil().setWidth(94),),
                Text("已标记",style: TextStyle(color: Color.fromRGBO(184, 184, 184, 1), fontSize: ScreenUtil().setSp(28)),
                  ),
              ],
            ),
          ],
      );
    }

//单选/多选/填空/判断
 Widget selectType(BuildContext context,String type,Color color){
   return  Container(
            child: new Material(
              child: new Ink(
                decoration: new BoxDecoration(
                  color: color,
                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setHeight(21))),
                ),
                child: new InkWell(
                    borderRadius: new BorderRadius.circular(25.0),
                    onTap: () {
                       Navigator.push<Object>(context,   MaterialPageRoute(
                                builder: (BuildContext context) {   return  Exam();
                                },
                            ),
                          );
                    },
                    child: Container(
                      alignment: Alignment(0, 0),
                        width:ScreenUtil().setWidth(80) ,
                        height: ScreenUtil().setHeight(42),
                      child:  Text(type,style: TextStyle( fontSize:ScreenUtil().setSp(22) ,color: Colors.white),),
                            )
                      ),
                ),
              ),
            );
 }
 
 //已答/未答题
 Widget AnswerType(String text,Color color){
   return Container(
            alignment: Alignment(0, 0),
            height: ScreenUtil().setHeight(40),
            width: ScreenUtil().setWidth(80),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setHeight(20))),
              border: new Border.all(width: ScreenUtil().setSp(2), color: color),
            ),
            child:Text(text,style: TextStyle( fontSize:ScreenUtil().setSp(22) ,color:color),),                      
          );
 }
 
 Widget TestList(BuildContext context,String selectType_text,Color selectType_color,String AnswerTypeText,Color AnswerType_color){
   return  Container(
            height: ScreenUtil().setHeight(116),
            width: double.infinity,
            color: Color.fromRGBO(255, 255, 255, 1),
            child: Row(
              children: <Widget>[
                SizedBox(width: ScreenUtil().setWidth(36),),
                CollectionStart(),
                SizedBox(width: ScreenUtil().setWidth(6),),
                selectType(context,selectType_text,selectType_color),
                SizedBox(width: ScreenUtil().setWidth(36),),
                Text("武汉的冬天不像南方那么…",style: TextStyle( fontSize:ScreenUtil().setSp(30) ,color: Color.fromRGBO(0, 0, 0, 1)),),
                //AnswerType("未答", Color.fromRGBO(74, 74, 74, 1)),
                SizedBox(width: ScreenUtil().setWidth(52),),
                AnswerType(AnswerTypeText, AnswerType_color),
                SizedBox(width: ScreenUtil().setWidth(16),),
                Image(
                  image: AssetImage("images/more.png"),
                  width: ScreenUtil().setWidth(18),
                  height: ScreenUtil().setHeight(26),
                )
                
              ],
            ),
          );
 }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}
