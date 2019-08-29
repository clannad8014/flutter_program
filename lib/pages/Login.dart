import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * 登录界面
 */

class LoginView extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
   ScreenUtil.instance = ScreenUtil(width: 752, height:1280)..init(context);
   SystemChrome.setPreferredOrientations([
    // DeviceOrientation.portraitDown,
    // DeviceOrientation.portraitUp
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
     //相关参数
    var _topHeight=ScreenUtil().setHeight(200);
    var _titleHeight=ScreenUtil().setHeight(100);
    //中间容器尺寸
    var _conterContainerWidth=ScreenUtil().setWidth(300);
    var _conterContainerHeight=ScreenUtil().setHeight(500);
    //内部容器边距
    double _leftPadding=ScreenUtil().setWidth(50);
    double _rightPadding=ScreenUtil().setWidth(50);
    double _topPadding=ScreenUtil().setHeight(50);
    double _bottomPadding=ScreenUtil().setHeight(50);
    //内部容器尺寸
    var _insideContainerWidth=ScreenUtil().setWidth(300);
    var _insideContainerHeight=ScreenUtil().setHeight(400);
    //输入框尺寸和内边距
    var _TextTopHeight=ScreenUtil().setHeight(20);
    
    //按钮尺寸
    var _buttonTopHeight=ScreenUtil().setHeight(60);
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
         body:  Container(
                width: ScreenUtil().setWidth(1280),
                // height: ScreenUtil().setHeight(752),
                  decoration: BoxDecoration(
                  color: Color.fromRGBO(216,216,216,1),
              ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: _topHeight,),
                    _Title(),
                    SizedBox(height: _titleHeight,),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(242,242,242,1),
                        border: new Border.all(color: Colors.grey, width: 0.5), // 边色与边宽度
                      ),
                      width: _conterContainerWidth,
                      height: _conterContainerHeight,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(_leftPadding, _topPadding, _rightPadding,_bottomPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("身份证号码"),
                              SizedBox(height:_TextTopHeight,),
                              _idTextFormField(),
                              SizedBox(height:_buttonTopHeight,),
                              _ButtonLogin(context),
                            ]
                          ),
                      )
                    )

                ],
              ),
            ),
          )
          
    );
  }

}//
  
  //Login Title
  Widget _Title(){
      return Padding(
        padding: EdgeInsets.all(0.0),
        child: Text(
          '考生登录',
          style: TextStyle(color: Colors.blueAccent,fontSize: ScreenUtil().setSp(26),fontWeight: FontWeight.w600 ),
        ),
      );
  }

  var _unameController = new TextEditingController();
  var _uidController = new TextEditingController();

  Widget _idTextFormField(){
     return Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(242,242,242,1),
          border: new Border.all(color: Colors.black, width: 1), // 边色与边宽度
        ),
        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(1), ScreenUtil().setHeight(0), ScreenUtil().setWidth(1), ScreenUtil().setHeight(0)),
        child: TextFormField(
                controller: _unameController,
                decoration: InputDecoration(
               
                  hintStyle: TextStyle(
                      fontSize:ScreenUtil().setSp(25),
                      color:Colors.grey,
                        ),
                ),
              onChanged: (text) { },
            ),
     );
  }
  //登录Button
  Widget _ButtonLogin(BuildContext context){

      return Align(
          child: SizedBox(
            height: ScreenUtil().setHeight(104),
            width: ScreenUtil().setWidth(600),
            child:
              Material(
          child:  RaisedButton(
              onPressed: () {
           
              },
              color: const Color.fromRGBO(73, 157, 241,1),
              child: Text(
                  "登录",
                  style: TextStyle( fontSize:ScreenUtil().setSp(12) ,color: Colors.white),
                        ),
                    ),
                borderRadius: BorderRadius.circular(40.0),
            ),
      
          ),
          
        );
  }

class login extends StatefulWidget {
  login({Key key}) : super(key: key);

  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  void initState() {
  //     SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.landscapeLeft,
  //   DeviceOrientation.landscapeRight
  // ]);
  print("SS");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      //  child: child,
      
    );
  }
}