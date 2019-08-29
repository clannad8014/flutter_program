import 'package:flutter/material.dart';
import '../../res/flutter_screenutil.dart';
/**
 * 考试中。。。
 */
class Exam extends StatefulWidget {
  Exam({Key key}) : super(key: key);

  _ExamState createState() => _ExamState();
}

class _ExamState extends State<Exam> {
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
                     height: ScreenUtil().setHeight(58),
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
                  padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(44), ScreenUtil().setHeight(28), 
                            ScreenUtil().setWidth(46), 0, ),
                  child: Container(
                    width: ScreenUtil().setWidth(660),
                    height: ScreenUtil().setHeight(1090),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height:ScreenUtil().setHeight(26)),
                        TitleList(),
                        SizedBox(height:ScreenUtil().setHeight(30)),
                        TitleButton(),
                        Padding(
                             padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(42), ScreenUtil().setHeight(22), 
                            ScreenUtil().setWidth(40), ScreenUtil().setHeight(12), ),
                            child:  Text('    武汉的冬天不像南方那么暖和,冷起来寒风刺骨。人睡在床上,上面盖了两床被子,在压上一件厚衣服,半夜仍会感到寒冷。',
                            style: TextStyle(color:Color.fromRGBO(0,0,0,1),fontSize: ScreenUtil().setSp(34),fontWeight: FontWeight.w400 ) ,                   
                            ),
                        ),
                        Image(
                            image: AssetImage("images/test_temp.png"),
                            fit: BoxFit.cover,
                            width: ScreenUtil().setWidth(568),
                            height: ScreenUtil().setHeight(302),
                          ),
                        test_RadioList(),  
                        SizedBox(height: ScreenUtil().setHeight(8),),
                        Row(
                          children: <Widget>[
                            SizedBox(width: ScreenUtil().setWidth(42),),
                            // nextButton("上一题","images/left.png"),
                            SwitchButton("images/left.png"),
                            SizedBox(width: ScreenUtil().setWidth(74),),
                            InputButton("选题"),
                            SizedBox(width: ScreenUtil().setWidth(52),),
                             InputButton("交卷"),
                            // inpuButton(context,"交卷"),
                            SizedBox(width: ScreenUtil().setWidth(74),),
                            // nextButton("下一题","images/right.png"),
                            SwitchButton("images/right.png"),      
              
                          ],
                        )
                        
                      ],
                    ),
                  ),
                        )
       ]
         )
        )
       );
    }

     bool startFlag=false;
      String startImage="images/start0.png";
    //题号栏(题号)
    Widget TitleList(){
     
      return Row(
        children: <Widget>[
            SizedBox(width:ScreenUtil().setWidth(42),),
            Text('单元总题号：1/100 考试总题号：18',
             style: TextStyle(color:Color.fromRGBO(155,155,155,1),fontSize: ScreenUtil().setSp(24),fontWeight: FontWeight.w400 ) ,                     
             ),
             SizedBox(width:ScreenUtil().setWidth(113),),
             CollectionStart(),
             
        ],
      );
    }
         
    //试题类型Button(能力测试，单选)
    Widget TitleButton(){
      return Row(
        children: <Widget>[
          SizedBox(width:ScreenUtil().setWidth(42),),
          SizedBox(
            width:ScreenUtil().setWidth(158) ,
            height: ScreenUtil().setHeight(42),
            child: Material(
                child:  RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)) ,
                    color: const Color.fromRGBO(255,198,105,1),
                    child: Text("能力测试",style: TextStyle( fontSize:ScreenUtil().setSp(22) ,color: Colors.white),),
                  
                      ),
              )
              ),
              SizedBox(width:ScreenUtil().setWidth(22),),
            SizedBox(
            width:ScreenUtil().setWidth(116) ,
            height: ScreenUtil().setHeight(36),
            child: Material(
                child:  RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)) ,
                    color: const Color.fromRGBO(255,161,105,1),
                    child: Text("单选",style: TextStyle( fontSize:ScreenUtil().setSp(22) ,color: Colors.white),),
                  
                      ),
              borderRadius: BorderRadius.circular(60.0),
              )
              ),
        ],
      );
    }
     
        String _groupValue='';
        String _a = "A. 武汉的冬天很冷";
        String _b = "B. 在武汉，冬夜难眠";
        String _c = "C. 武汉的冬天比南方冷的多";
        String _d = "D. 武汉的冬天睡在床上很冷";
        Color text_color_a=Color.fromRGBO(0,0,0,1);
        Color text_color_b=Color.fromRGBO(0,0,0,1);
        Color text_color_c=Color.fromRGBO(0,0,0,1);
        Color text_color_d=Color.fromRGBO(0,0,0,1);
    //radioButton 选择选项
    Widget test_RadioList(){
         
         return Container(
      child: Column(
        children: <Widget>[
          RadioListTile<String>(
            value: 'a',
            title: Text(_a, style: TextStyle(color:text_color_a,fontSize: ScreenUtil().setSp(34),fontWeight: FontWeight.w400 ),),
            dense: true,
            groupValue: _groupValue,
             onChanged:_Textcolor
          ),

            RadioListTile<String>(
            value: 'b',
            title: Text(_b,style: TextStyle(color:text_color_b,fontSize: ScreenUtil().setSp(34),fontWeight: FontWeight.w400 ),),
            dense: true,
            selected: true,
            groupValue: _groupValue,
            onChanged:_Textcolor
          ),

            RadioListTile<String>(
            value: 'c',
            title: Text(_c,style: TextStyle(color:text_color_c,fontSize: ScreenUtil().setSp(34),fontWeight: FontWeight.w400 ),),
            dense: true,
            activeColor: Colors.blue,
            groupValue: _groupValue,
            onChanged:_Textcolor
          ),
           RadioListTile<String>(
            value: 'd',
            title: Text(_d,style: TextStyle(color:text_color_d,fontSize: ScreenUtil().setSp(34),fontWeight: FontWeight.w400 ),),
            dense: true,
            groupValue: _groupValue,
            onChanged:_Textcolor

           
          ),
         
        ],
      )
    );

    }

    //选中变颜色  
    void _Textcolor(value) {
        _groupValue= value;
        setState(() {});
          
            switch(_groupValue) { 
              case 'a': { 
                   text_color_a=Color.fromRGBO(73, 157, 241, 1);
                   text_color_b=Color.fromRGBO(0,0,0,1);
                   text_color_c=Color.fromRGBO(0,0,0,1);
                   text_color_d=Color.fromRGBO(0,0,0,1);
              } 
              break; 

              case 'b': { 
                   text_color_a=Color.fromRGBO(0,0,0,1);
                   text_color_b=Color.fromRGBO(73, 157, 241, 1);
                   text_color_c=Color.fromRGBO(0,0,0,1);
                  text_color_d=Color.fromRGBO(0,0,0,1);
              } 
              break; 
               case 'c': { 
                  text_color_a=Color.fromRGBO(0,0,0,1);
                  text_color_b=Color.fromRGBO(0,0,0,1);
                  text_color_c=Color.fromRGBO(73, 157, 241, 1);
                  text_color_d=Color.fromRGBO(0,0,0,1);
              } 
              break; 

              case 'd': { 
                  text_color_a=Color.fromRGBO(0,0,0,1);
                  text_color_b=Color.fromRGBO(0,0,0,1);
                  text_color_c=Color.fromRGBO(73, 157, 241, 1);
                  text_color_d=Color.fromRGBO(0,0,0,1);
              } break; 

              default: { 
                  text_color_a=Color.fromRGBO(0,0,0,1);
                  text_color_b=Color.fromRGBO(0,0,0,1);
                  text_color_c=Color.fromRGBO(73, 157, 241, 1);
                  text_color_d=Color.fromRGBO(0,0,0,1);
              }break; 
            }

           
      }
    //Button前一个/后一个
    Widget nextButton(String text,String img){
       return SizedBox(
          width: ScreenUtil().setWidth(88),
          height: ScreenUtil().setHeight(88),
          child:  FloatingActionButton(
                onPressed: (){},
                tooltip: text,
                elevation:0,
                child:Image(
                  image: AssetImage(img),
                  width: ScreenUtil().setWidth(38),
                  height: ScreenUtil().setHeight(44),
                )
                ),
              );
     }
    
    Widget SwitchButton(String img){
          return   Container(
                  width: ScreenUtil().setWidth(88),
                  height: ScreenUtil().setHeight(88),
                  alignment:Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child:   GestureDetector(
                      child:   Image(
                            image: AssetImage(img),
                            //fit: BoxFit.cover,
                            width: ScreenUtil().setWidth(44),
                            height: ScreenUtil().setHeight(38),
                          ),
                      onTap: (){
                            Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context)=>Exam()
                            )
                        );
                      },)
                  );
    }
    //交卷、选题
    Widget InputButton(String text){
      return  Container(
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setHeight(100),
            alignment:Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                
              ),
              child:   GestureDetector(
                child: Text( text,
                  style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(32),fontWeight: FontWeight.w400),
                ),
                onTap: (){
                      if(text.trim()=="交卷"){
                          Navigator.pushNamed(context, '/SelectTest'); 
                      }else if(text.trim()=="选题"){
                          Navigator.pushNamed(context, '/SelectType'); 
                      }
                      // Navigator.of(context).push(
                      // MaterialPageRoute(
                      //   builder: (context)=>Exam()
                      // )
                      // );
                },)
            );
    }
   
    Widget inpuButton(BuildContext context,String text){
      return  SizedBox(
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setHeight(100),
            child:  FloatingActionButton(
                  onPressed: (){
                      // Navigator.push(context,
                      // MaterialPageRoute(builder: (context) => Layout_6()));
                  },
                  elevation:0,
                  tooltip: text,
                  child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(32)),
                ),
                  ),
            );
    }

    }


 
//收藏
class CollectionStart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _StartState();
}

class _StartState extends State<CollectionStart> { 
      var startFlag=false;
      String startImage="images/start0.png";


       _onClick() {
          setState(() {
             startFlag=!startFlag;
              if(startFlag){
              startImage="images/start0.png";
              }else{
                startImage="images/start.png";
              }
          });
         }
 @override
  Widget build(BuildContext context) {
    return   InkWell(
                  child:  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage(startImage),
                        width:ScreenUtil().setWidth(50) ,
                        height: ScreenUtil().setHeight(50),
                      )
                    ],
                  ),
                  onTap: _onClick,
                );
  }
}

 //radioButton 选择选项
class RadioList extends StatefulWidget {
  @override
  _RadioListState createState() => _RadioListState();
}

 class _RadioListState extends State<RadioList> {
     String _groupValue='';
     String _a = "A. 武汉的冬天很冷";
     String _b = "B. 在武汉，冬夜难眠";
     String _c = "C. 武汉的冬天比南方冷的多";
     String _d = "D. 武汉的冬天睡在床上很冷";
     Color text_color_a=Color.fromRGBO(0,0,0,1);
     Color text_color_b=Color.fromRGBO(0,0,0,1);
     Color text_color_c=Color.fromRGBO(0,0,0,1);
     Color text_color_d=Color.fromRGBO(0,0,0,1);

  @override
  Widget build(BuildContext context) { 
    
    return Container(
      child: Column(
        children: <Widget>[
          RadioListTile<String>(
            value: 'a',
            title: Text(_a, style: TextStyle(color:text_color_a,fontSize: ScreenUtil().setSp(34),fontWeight: FontWeight.w400 ),),
            dense: true,
            groupValue: _groupValue,
             onChanged:_Textcolor
          ),

            RadioListTile<String>(
            value: 'b',
            title: Text(_b,style: TextStyle(color:text_color_b,fontSize: ScreenUtil().setSp(34),fontWeight: FontWeight.w400 ),),
            dense: true,
            selected: true,
            groupValue: _groupValue,
            onChanged:_Textcolor
          ),

            RadioListTile<String>(
            value: 'c',
            title: Text(_c,style: TextStyle(color:text_color_c,fontSize: ScreenUtil().setSp(34),fontWeight: FontWeight.w400 ),),
            dense: true,
            activeColor: Colors.blue,
            groupValue: _groupValue,
            onChanged:_Textcolor
          ),
           RadioListTile<String>(
            value: 'd',
            title: Text(_d,style: TextStyle(color:text_color_d,fontSize: ScreenUtil().setSp(34),fontWeight: FontWeight.w400 ),),
            dense: true,
            groupValue: _groupValue,
            onChanged:_Textcolor

           
          ),
         
        ],
      )
    );
 
  }
  //选项选中变色
      void _Textcolor(value) {
        _groupValue= value;
        setState(() {});
        
            switch(_groupValue) { 
              case 'a': { 
                   text_color_a=Color.fromRGBO(73, 157, 241, 1);
                   text_color_b=Color.fromRGBO(0,0,0,1);
                   text_color_c=Color.fromRGBO(0,0,0,1);
                   text_color_d=Color.fromRGBO(0,0,0,1);
              } 
              break; 

              case 'b': { 
                   text_color_a=Color.fromRGBO(0,0,0,1);
                   text_color_b=Color.fromRGBO(73, 157, 241, 1);
                   text_color_c=Color.fromRGBO(0,0,0,1);
                  text_color_d=Color.fromRGBO(0,0,0,1);
              } 
              break; 
               case 'c': { 
                  text_color_a=Color.fromRGBO(0,0,0,1);
                  text_color_b=Color.fromRGBO(0,0,0,1);
                  text_color_c=Color.fromRGBO(73, 157, 241, 1);
                  text_color_d=Color.fromRGBO(0,0,0,1);
              } 
              break; 

              case 'd': { 
                  text_color_a=Color.fromRGBO(0,0,0,1);
                  text_color_b=Color.fromRGBO(0,0,0,1);
                  text_color_c=Color.fromRGBO(73, 157, 241, 1);
                  text_color_d=Color.fromRGBO(0,0,0,1);
              } break; 

              default: { 
                  text_color_a=Color.fromRGBO(0,0,0,1);
                  text_color_b=Color.fromRGBO(0,0,0,1);
                  text_color_c=Color.fromRGBO(0,0,0,1);
                  text_color_d=Color.fromRGBO(73, 157, 241, 1);
              }break; 
            }

           
      }

}