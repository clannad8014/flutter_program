import 'package:flutter/material.dart';
import 'res/flutter_screenutil.dart';
void main(){
  runApp(Login());
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,  
      //home: Layout()
      // home: Layout_2()
      //home: Layout_3()
     // home: Layout_4()
     // home: Layout_5()
         home: Layout_6()
      // home: Layout_7()
      //home:LearnRadioButton()
    );
  }
}

//Column+padding布局(类似于div布局)
class Layout2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width:750, height: 1624)..init(context);

      //height: ScreenUtil().setHeight(),
      //width: ScreenUtil().setWidth(),
      //ScreenUtil().setSp()  //适配字体
    return Scaffold(
         body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/login_bg.png"),
            fit: BoxFit.cover,
            
          ),
        ),
      //  child: Center(
         child: 
         ListView(
          // fit: StackFit.expand,
           children: <Widget>[
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Padding(
                   padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(76), ScreenUtil().setHeight(338), 
                   0, 0),
                   child: Title(),
                 ),
                Padding(
                   padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(76), ScreenUtil().setHeight(76), 
                   ScreenUtil().setWidth(38), 0),
                   child:Text('考生姓名',
                   style: TextStyle(fontSize: ScreenUtil().setSp(30),fontWeight: FontWeight.w400)
                   ),
                ),
                 Padding(
                   padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(76), ScreenUtil().setHeight(16), 
                   ScreenUtil().setWidth(76), 0),
                   child: UnameText(),
                ),
                 Padding(
                   padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(76), ScreenUtil().setHeight(50), 
                   ScreenUtil().setWidth(76), 0),
                   child:Text(
                     '准考证号',style: TextStyle(fontSize: ScreenUtil().setSp(30),fontWeight: FontWeight.w400 ),
                     ),
                ),
                 Padding(
                   padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(76), ScreenUtil().setHeight(16), 
                   ScreenUtil().setWidth(76), 0),
                   child: UidText(),
                ),
                 Padding(
                   padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(70), ScreenUtil().setHeight(102), 
                   ScreenUtil().setWidth(80), 0),
                   child: Button_login(context),
                ),
               ],
             )
           ],
         )
     
         ,
         
         
        //),
      ),

      );
  }

}

//Listview+sizeBox填充
class Layout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height:1624)..init(context);

     print('Device width px:${ScreenUtil.screenWidth}'); //Device width
     print('Device height px:${ScreenUtil.screenHeight}'); //Device height
      //height: ScreenUtil().setHeight(),
      //width: ScreenUtil().setWidth(),
      //ScreenUtil().setSp()  //适配字体
 
    return Scaffold(
         body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/login_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child:  ListView(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(76)),
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil().setHeight(338),
                ),
                Title(),
                SizedBox(height: ScreenUtil().setHeight(76)),
                Text('考生姓名',style: TextStyle(fontSize: ScreenUtil().setSp(30),fontWeight: FontWeight.w400  ),),
               
                UnameText(),
                SizedBox(height: ScreenUtil().setHeight(50)),
                Text('准考证号',style: TextStyle(fontSize: ScreenUtil().setSp(30),fontWeight: FontWeight.w400  ),),
                UidText(),
                SizedBox(height: ScreenUtil().setHeight(102)),
                Button_login(context),
              ],
            ),
        ),
      ),
      

      );
  }

}
  
  //Login Title
  Padding Title(){
      return Padding(
        padding: EdgeInsets.all(0.0),
        child: Text(
          'Login',
          style: TextStyle(fontSize: ScreenUtil().setSp(56),fontWeight: FontWeight.w600 ),
        ),
      );
  }

  var unameController = new TextEditingController();
  var uidController = new TextEditingController();
  //考生姓名输入框
  TextFormField UnameText() {
    return TextFormField(
      controller: unameController,
      decoration: InputDecoration(
        //labelText: '请输入您的姓名',
        hintText:"请输入您的姓名",
         hintStyle: TextStyle(
            fontSize:ScreenUtil().setSp(36),
            color:Colors.grey,
              ),
      ),
      onChanged: (text) {
        //内容改变的回调
        
      },
     
    );
  }

 //准考证号输入框
  TextFormField UidText() {
    return TextFormField(
       controller: uidController,
      decoration: InputDecoration(
        //labelText: '请输入准考证号',
        hintText:"请输入准考证号",
        hintStyle: TextStyle(
        fontSize:ScreenUtil().setSp(36),
         color:Colors.grey,
    ),
      ),
  
    );
  }
  
  //登录Button
  Align Button_login(BuildContext context){

      return Align(
          child: SizedBox(
            height: ScreenUtil().setHeight(104),
            width: ScreenUtil().setWidth(600),
            child:
              Material(
          child:  RaisedButton(
              onPressed: () {
                //==========================    
       
          if (unameController.text.toString().trim().length==0 || uidController.text.toString().trim().length==0) {
            
            showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text("提示框"),
                    content: Text("输入内容不能为空？"),
                    actions:<Widget>[
                       FlatButton(child:Text("取消"), onPressed: (){
                        Navigator.of(context).pop();

                      },),
                        FlatButton(child:Text("确认"), onPressed: (){
                        Navigator.of(context).pop();

                      },)
                    ]
                  );
                },

            );
            
          } else if(unameController.text.toString().trim().length>0 && uidController.text.toString().trim().length>0){
            
            showDialog(

                context: context,
                builder: (context){
                  return AlertDialog(

                       title: Text("请确认信息"),
                       content: Text("考生姓名:${unameController.text.toString()}"+"  准考证号:${uidController.text.toString()}"),

                    actions:<Widget>[
                        FlatButton(child:  Text("取消"), onPressed: (){
                        Navigator.of(context).pop();

                      },),
                        FlatButton(child:  Text("确认"), onPressed: (){
                        Navigator.of(context).pop();

                      },)
                    ]
                  );
                },

            );
              
              
          }
           
                //=========================
              },
              color: const Color.fromRGBO(73, 157, 241,1),
              child: Text(
                  "登录",
                  style: TextStyle( fontSize:ScreenUtil().setSp(36) ,color: Colors.white),
                        ),
                    ),
                borderRadius: BorderRadius.circular(40.0),
            ),
      
          ),
          
        );
  }


  class Layout_2 extends StatelessWidget{
    
    @override
    Widget build(BuildContext context) {
      ScreenUtil.instance = ScreenUtil(width:750, height: 1624)..init(context);
      // TODO: implement build
      return Scaffold(
         body:  Column(
             crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(0),
                   child: Container(
                     width: ScreenUtil().setWidth(750),
                     height: ScreenUtil().setHeight(176),
                     color: Color.fromRGBO(242,242, 242, 1),
                   ),
                 ),

                Align(
                    alignment: Alignment.center,
                    //widthFactor: 2.0,
                    heightFactor: 1.3,
                    child:  Text('国家电网公司2019秋季校园招聘考试',
                        style: TextStyle(fontSize: ScreenUtil().setSp(36),fontWeight: FontWeight.w400 ) ,                     
                                ),
                    ),
                Container(
                    width: ScreenUtil().setWidth(750),
                    height: ScreenUtil().setHeight(28),
                    color: Color.fromRGBO(242,242, 242, 1),
                  ),
               
                Padding(
                   padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(254), ScreenUtil().setHeight(48), 
                   ScreenUtil().setWidth(254),ScreenUtil().setHeight(46)),
                   child: Image.asset("images/test.png"),
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
                  ScreenUtil().setWidth(0),ScreenUtil().setHeight(25)),
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
              height: ScreenUtil().setHeight(480),
              //height: double.infinity,
              color: Color.fromRGBO(242,242, 242, 1),
              padding: EdgeInsets.fromLTRB(0,ScreenUtil().setHeight(260),0,0),
              child:  Row(
                children: <Widget>[
                  SizedBox(width:ScreenUtil().setWidth(68) ),
                  SizedBox(
                    width:ScreenUtil().setWidth(248) ,
                    height: ScreenUtil().setHeight(88),
                    child: Material(
                      child:  RaisedButton(
                         onPressed: () {},
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
                         onPressed: () {},
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
 
  class Layout_3 extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      ScreenUtil.instance = ScreenUtil(width:750, height: 1624)..init(context);
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
                     height: ScreenUtil().setHeight(176),
                     //color: Color.fromRGBO(242,242, 242, 1),
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
                              height: ScreenUtil().setHeight(1044),
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
                            //   value: false,
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
                                onPressed: () {},
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


  class Layout_4 extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      ScreenUtil.instance = ScreenUtil(width:750, height: 1624)..init(context);
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
                     height: ScreenUtil().setHeight(176),
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
                     height: ScreenUtil().setHeight(216),
                          decoration: new BoxDecoration(
                          border: new Border.all(color: Color.fromRGBO(233,233,233,1), width: 1),                       
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height:  ScreenUtil().setHeight(28)),
                            Text('本次考试包含5个模块，总时长60分钟',
                      style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(32),fontWeight: FontWeight.w400 ) ,                     
                              ),
                            SizedBox(height:  ScreenUtil().setHeight(35)),
                            Text('00:58:44',
                      style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(56),fontWeight: FontWeight.w500 ) ,                     
                              ),
                          
                          ],
                        ),
                   ),
                  ),
                  
                   BuildRow("能力测试","智力测试",0),
                   SizedBox(height: ScreenUtil().setHeight(42),  ),
                   BuildRow("行为测试","性格测试",0),
                   SizedBox(height: ScreenUtil().setHeight(42),  ),
                   BuildRow("逻辑测试","语言测试",100),
                   SizedBox(height: ScreenUtil().setHeight(58),  ),
                   Button_inform()
            ]      
             )
           )
         );  
      }

      Row BuildRow(String title_1,String title_2,int n){
        return Row(
           children: <Widget>[
             SizedBox(width: ScreenUtil().setWidth(46),    ),
                  
              Container(
                width: ScreenUtil().setWidth(308),
                height: ScreenUtil().setHeight(240),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                  image: new AssetImage('images/div_bg.png'), 
                  fit: BoxFit.cover// 填满
                  ),
                  
                ),
                  child:Column(
                    children: <Widget>[
                      SizedBox( height: ScreenUtil().setHeight(30),),
                      Text(title_1,
                            style: TextStyle(color:Color.fromRGBO(0,0,0,1) ,fontSize: ScreenUtil().setSp(38),fontWeight: FontWeight.w400 ),
                            ),
                      SizedBox( height: ScreenUtil().setHeight(70),),      
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
               SizedBox(width: ScreenUtil().setWidth(42),    ),
              Container(
                width: ScreenUtil().setWidth(308),
                height: ScreenUtil().setHeight(240),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                  image: new AssetImage('images/div_bg.png'), 
                  fit: BoxFit.cover// 填满
                  ),
                  
                ),
                  child:Column(
                    children: <Widget>[
                      SizedBox( height: ScreenUtil().setHeight(30),),
                      Text(title_2,
                            style: TextStyle(color:Color.fromRGBO(0,0,0,1) ,fontSize: ScreenUtil().setSp(38),fontWeight: FontWeight.w400 ),
                            ),
                      SizedBox( height: ScreenUtil().setHeight(70),),      
                      Row(
                        children: <Widget>[
                          SizedBox( width: ScreenUtil().setWidth(42),),
                            Text("共100道",
                            style: TextStyle(color:Color.fromRGBO(155,155,155,1) ,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w400 ),
                            ),
                            SizedBox( width: ScreenUtil().setWidth(12),),
                              Text("已答"+n.toString()+"道",
                            style: TextStyle(color:Color.fromRGBO(74,74,74,1) ,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w400 ),
                            ),
                        ],
                      ),
                      
                    ],
                  )
              )
              
            ],
        );
      }
      Padding Button_inform(){
        return Padding(
          padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(36), ScreenUtil().setHeight(45), 
          ScreenUtil().setWidth(34), ScreenUtil().setHeight(0)),
          child: SizedBox(
              width:ScreenUtil().setWidth(680) ,
              height: ScreenUtil().setHeight(88),
              child: Material(
                  child:  RaisedButton(
                      onPressed: () {},
                      color: const Color.fromRGBO(73,157,241,1),
                      child:    Text(" 我要交卷",style: TextStyle( fontSize:ScreenUtil().setSp(32) ,color: Colors.white),),
                    
                        ),
                borderRadius: BorderRadius.circular(40.0),
                
                )
              ),
            );
      }
  }

  class Layout_5 extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      ScreenUtil.instance = ScreenUtil(width:750, height: 1624)..init(context);
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
                     height: ScreenUtil().setHeight(88),
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
                   // height: ScreenUtil().setHeight(1320),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height:ScreenUtil().setHeight(26)),
                        title_list(),
                        SizedBox(height:ScreenUtil().setHeight(55)),
                        title_button(),
                        Padding(
                             padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(42), ScreenUtil().setHeight(22), 
                            ScreenUtil().setWidth(40), ScreenUtil().setHeight(12), ),
                            child:  Text('    武汉的冬天不像南方那么暖和，冷起来寒风刺骨。人睡在床上，上面盖了两床被子，在压上一件厚衣服，半夜仍会感到寒冷。',
                            style: TextStyle(color:Color.fromRGBO(0,0,0,1),fontSize: ScreenUtil().setSp(34),fontWeight: FontWeight.w400 ) ,                   
                            ),
                        ),
                        Image(
                            image: AssetImage("images/test_temp.png"),
                            width: ScreenUtil().setWidth(568),
                            height: ScreenUtil().setHeight(332),
                          ),
                         
                         Padding(
                             padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(0), ScreenUtil().setHeight(44), 
                            ScreenUtil().setWidth(0), ScreenUtil().setHeight(0), ),
                            child: Container(
                               width:  ScreenUtil().setWidth(560),
                               height: ScreenUtil().setHeight(352),
                               child: select(),
                            )
                          ),
                          SizedBox(height:ScreenUtil().setHeight(42)),
                          Row(
                         children: <Widget>[
                           SizedBox(width:ScreenUtil().setWidth(32)),
                           Button_sel("images/left.png"),
                           SizedBox(width:ScreenUtil().setWidth(35)),
                           Button_change("选题"),
                           SizedBox(width:ScreenUtil().setWidth(36)),
                           Button_change("交卷"),
                           SizedBox(width:ScreenUtil().setWidth(36)),
                           Button_sel("images/right.png"),
                         ],
                          ),
                         // SizedBox(height:ScreenUtil().setHeight(44)),
                            
                      ],
                    ),
                  ),
                        ),
       ]
         )
        )
       );
    }
    Row title_list(){
      return Row(
        children: <Widget>[
            SizedBox(width:ScreenUtil().setWidth(42),),
            Text('单元总题号：1/100 考试总题号：18',
             style: TextStyle(color:Color.fromRGBO(155,155,155,1),fontSize: ScreenUtil().setSp(24),fontWeight: FontWeight.w400 ) ,                     
             ),
             SizedBox(width:ScreenUtil().setWidth(113),),
             Image.asset("images/start.png"),
             
        ],
      );
    }
    
    Row title_button(){
      return Row(
        children: <Widget>[
          SizedBox(width:ScreenUtil().setWidth(42),),
          Container(
            width:ScreenUtil().setWidth(157) ,
            height: ScreenUtil().setHeight(40),
            //padding: ,
            child: Material(
                child:  RaisedButton(
                    onPressed: () {},
                    color: const Color.fromRGBO(255,198,105,1),
                    child: Text("能力测试",style: TextStyle( fontSize:ScreenUtil().setSp(22) ,color: Colors.white),),
                  
                      ),
                  shape: StadiumBorder(),
                    
                 // borderRadius: BorderRadius.circular(40.0),
              )
              ),
              SizedBox(width:ScreenUtil().setWidth(22),),
            SizedBox(
            width:ScreenUtil().setWidth(120) ,
            height: ScreenUtil().setHeight(40),
            child: Material(
                child:  RaisedButton(
                    onPressed: () {},
                    color: const Color.fromRGBO(255,161,105,1),
                    child: Text("单选",style: TextStyle( fontSize:ScreenUtil().setSp(22) ,color: Colors.white),),
                  
                      ),
              borderRadius: BorderRadius.circular(60.0),
              )
              ),
           
        ],
      );
    }
    
    InkWell cheek(){
      bool _value = false;
      return InkWell(
        onTap: () {
          //setState();
          _value = !_value;
          print(_value.toString());
        },
        child:  Container(
              width:ScreenUtil().setWidth(28),
              height:ScreenUtil().setHeight(28) ,
          decoration: BoxDecoration(shape: BoxShape.circle,border:  Border.all(color: Color.fromRGBO(151,151,151,1), width: 1),),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: _value
                ? Icon(
                    Icons.check,
                    size: ScreenUtil().setSp(22),
                    color: Color.fromRGBO(151,151,151,1),
                  )
                : Icon(
                    Icons.check_box_outline_blank,
                    size: ScreenUtil().setSp(22),
                    color: Colors.white,
                  ),
          ),
        ),
      );
    }
    //选项容器
    Column select(){
       bool _value = false;
        return Column(
          children: <Widget>[
            select_item("A. 武汉的冬天很冷"),
            SizedBox(height:ScreenUtil().setHeight(34)),
            select_item("B. 在武汉，冬夜难眠"),
            SizedBox(height:ScreenUtil().setHeight(34)),
            select_item("C. 武汉的冬天比南方冷的多"),
            SizedBox(height:ScreenUtil().setHeight(34)),
            select_item("D. 武汉的冬天睡在床上很冷"),
            ],
          );
    }
   //选项ltem
    Row select_item(String text){
     return   Row(
              children: <Widget>[
              SizedBox( width:ScreenUtil().setWidth(42)),
              cheek(),
              SizedBox( width:ScreenUtil().setWidth(22)),
              Padding(
              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(0), ScreenUtil().setHeight(0), 
              ScreenUtil().setWidth(0), ScreenUtil().setHeight(4), ),
                        
              child:  Text(text,
        style: TextStyle(color:Color.fromRGBO(0,0,0,1),fontSize: ScreenUtil().setSp(34),fontWeight: FontWeight.w400 ) ,                   
        ),
              )
              ],
            );
   }
    //上一题，下一题按钮
    SizedBox Button_sel(String img){
        return SizedBox(
            width:ScreenUtil().setWidth(100) ,
            height: ScreenUtil().setHeight(100),
            child: Material(
              shadowColor:Colors.white,
                child:  RaisedButton(
                    onPressed: () {},
                    color: const Color.fromRGBO(73,157,241,1),
                    shape:  CircleBorder(),
                    child:   ClipOval(
                      child: 
                      Image(
                        fit: BoxFit.fitWidth,
                        height:ScreenUtil().setHeight(100),
                        width:ScreenUtil().setWidth(100),
                        image: AssetImage(img)
                  )
                    ),
              ),
            )
        );
    }
    //选题/交卷
    SizedBox Button_change(String text){
      return SizedBox(
            width:ScreenUtil().setWidth(150) ,
            height: ScreenUtil().setHeight(100),
            child: Material(
              shadowColor:Colors.white,
                child:  RaisedButton(
                    onPressed: () {},
                    color: const Color.fromRGBO(73,157,241,1),
                    shape:  CircleBorder(),
                    child: Text(text,style: TextStyle( fontSize:ScreenUtil().setSp(32) ,color: Colors.white),),                  
                      ),
              )
              );
    }
  
  }

  //==============================


//=============================
class selectRadio_item extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _selectRadioButton();
  }
}
class _selectRadioButton extends State<selectRadio_item>{
  int groupValue=1;
  @override
  Widget build(BuildContext context) {
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         new RadioListTile(
           
              value: 1,
              groupValue: groupValue,
              title: Text("A. 武汉的冬天很冷",
        style: TextStyle(color:Color.fromRGBO(0,0,0,1),fontSize: ScreenUtil().setSp(34),fontWeight: FontWeight.w400 ) ,                   
        ),
              onChanged: (T){
                updateGroupValue(T);
              }),
          new RadioListTile(
              value: 2,
              groupValue: groupValue,
              title: new Text('B. 在武汉，冬夜难眠'),
              onChanged: (T){
                updateGroupValue(T);
              }),
          new RadioListTile(
              value: 3,
              groupValue: groupValue,
              title: new Text('C. 武汉的冬天比南方冷的多'),
              onChanged: (T){
                updateGroupValue(T);
              }),
          new RadioListTile(
              value: 4,
              groupValue: groupValue,
              title: new Text("D. 武汉的冬天睡在床上很冷"),
              onChanged: (T){
                updateGroupValue(T);
              })
        ],
      // ),
    );
  }

  void updateGroupValue(int v){
    setState(() {
      groupValue=v;
    });
  }

}



class Layout_7 extends StatelessWidget{
  @override 
    Widget build(BuildContext context) {
      ScreenUtil.instance = ScreenUtil(width:750, height: 1624)..init(context);
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
               height:ScreenUtil().setHeight(230),
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

class Layout_6 extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      ScreenUtil.instance = ScreenUtil(width:750, height: 1624)..init(context);
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
                     height: ScreenUtil().setHeight(88),
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
                 Container(
                   width:ScreenUtil().setWidth(750),
                   height: ScreenUtil().setHeight(120),
                   child: test_items(),
                 ),
                 Container(
                   width:ScreenUtil().setWidth(750),
                   height:ScreenUtil().setHeight(168),
                   color: Colors.white,
                   child: item_count(),
                 ),
                 SizedBox(height: ScreenUtil().setHeight(14),),
                
                  Container(
                   width:ScreenUtil().setWidth(750),
                   height:ScreenUtil().setHeight(1000),
                   color: Colors.white,
                   child: listview_items(),
                 ),
           ]
       ),
       )
        );
    }
    
    //测试类型
    Widget test_items(){
      return ListView(
            scrollDirection:Axis.horizontal,
            children: <Widget>[
           Padding(
              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), ScreenUtil().setHeight(30), 
              ScreenUtil().setWidth(0), ScreenUtil().setHeight(34), ),
                 child: Container(
            width:ScreenUtil().setWidth(188) ,
            height: ScreenUtil().setHeight(54),
            child: Material(
                child:  RaisedButton(
                    onPressed: () {},
                    color: const Color.fromRGBO(73,157,241,1),
                    child: Text("能力测试",style: TextStyle( fontSize:ScreenUtil().setSp(30) ,color: Colors.white),),
                  
                      ),
                  shape: StadiumBorder(),
                    
                 // borderRadius: BorderRadius.circular(40.0),
              )
              ),
           ),
           select_item("智力测试"),
           select_item("行为测试"),
           select_item("性格测试"),
           select_item("逻辑测试"),
           select_item("语言测试"),
          ],
          );

    }
    
    //测试类型button
    Widget select_item(String text){
      return   Padding(
              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), ScreenUtil().setHeight(30), 
              ScreenUtil().setWidth(20), ScreenUtil().setHeight(34), ),
                 child: Container(
            width:ScreenUtil().setWidth(188) ,
            height: ScreenUtil().setHeight(54),
            child: Material(
                child:  RaisedButton(
                    onPressed: () {},
                    color: const Color.fromRGBO(216,216,216,1),
                    child: Text(text,style: TextStyle( fontSize:ScreenUtil().setSp(30) ,color: Colors.white),),
                  
                      ),
                  shape: StadiumBorder(),
                    
              )
              ),
           );
    }
    
    //题型统计
    Widget item_count(){
      return Column(
        children: <Widget>[
          SizedBox(height:ScreenUtil().setHeight(34)),
          Row(
            children: <Widget>[
              SizedBox(width:ScreenUtil().setWidth(71)),
              Text('100道',
                style:  TextStyle(color: Color.fromRGBO(3,3,3,1),fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(36),),
                  ),
              SizedBox(width:ScreenUtil().setWidth(110)),
              Text('22道',
                style:  TextStyle(color: Color.fromRGBO(3,3,3,1),fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(36),),
                  ),
              SizedBox(width:ScreenUtil().setWidth(100)),
              Text('88道',
                style:  TextStyle(color: Color.fromRGBO(3,3,3,1),fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(36),),
                  ),
              SizedBox(width:ScreenUtil().setWidth(104)),
              Text('10道',
                style:  TextStyle(color: Color.fromRGBO(3,3,3,1),fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(36),),
                  ),
            ],
          ),
          SizedBox(width:ScreenUtil().setWidth(16)),
          Row(
            children: <Widget>[
              SizedBox( width:ScreenUtil().setWidth(62)),
              Text('单元题数',
                style:  TextStyle(color: Color.fromRGBO(184,184,184,1),fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(28),),
                  ),
             SizedBox( width:ScreenUtil().setWidth(96)),
              Text('已完成',
                style:  TextStyle(color: Color.fromRGBO(184,184,184,1),fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(28),),
                  ),
             SizedBox( width:ScreenUtil().setWidth(96)),
              Text('未完成',
                style:  TextStyle(color: Color.fromRGBO(184,184,184,1),fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(28),),
                  ),
             SizedBox( width:ScreenUtil().setWidth(96)),
              Text('已标记',
                style:  TextStyle(color: Color.fromRGBO(184,184,184,1),fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(28),),
                  ),
            ],
          )

        ],
      );
    }
    
    //答题列表
    Widget listview_items(){
        return ListView(
            children: <Widget>[
              Padding(
                 padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), ScreenUtil().setHeight(0), 
              ScreenUtil().setWidth(20), ScreenUtil().setHeight(0), ),
               child: Row(
                children: <Widget>[
                 Image(
                  image: AssetImage("images/start.png"),
                  width: ScreenUtil().setWidth(30),
                  height: ScreenUtil().setHeight(28),
                  ),
                  item_type1(),
                  Text('武汉的冬天不像南方那么…',
                style:  TextStyle(color: Color.fromRGBO(3,3,3,1),fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(36),),
                  ),
                  item_type2(),
                ],
               )
              ),
              
            ],
        );
    }
    
    Widget item_type1(){
      return   Padding(
              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), ScreenUtil().setHeight(30), 
              ScreenUtil().setWidth(20), ScreenUtil().setHeight(34), ),
                 child: Container(
            width:ScreenUtil().setWidth(115) ,
            height: ScreenUtil().setHeight(38),
            child: Material(
                child:  RaisedButton(
                    onPressed: () {},
                    color: const Color.fromRGBO(255,161,105,1),
                    child: Text("单选",style: TextStyle( fontSize:ScreenUtil().setSp(22) ,color: Colors.white),),                 
                        shape:new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)) ,
                      ),
              )
              ),
            
           );
    }

     Widget item_type2(){
      return   Padding(
              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), ScreenUtil().setHeight(30), 
              ScreenUtil().setWidth(20), ScreenUtil().setHeight(34), ),
                 child: Container(
            width:ScreenUtil().setWidth(115) ,
            height: ScreenUtil().setHeight(38),
            child: Material(
                child:  RaisedButton(
                    onPressed: () {},
                    color: const Color.fromRGBO(255,161,105,1),
                    child: Text("单选",style: TextStyle( fontSize:ScreenUtil().setSp(22) ,color: Color.fromRGBO(155,155,155,1)),),                 
                        shape:new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)) ,
                      ),
              )
              ),
            
           );
    }
    
    
  }