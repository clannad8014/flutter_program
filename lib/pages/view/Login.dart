import 'package:flutter/material.dart';
import '../../res/flutter_screenutil.dart';
import 'package:dio/dio.dart';
/**
 * 登录
 */
class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   ScreenUtil.instance = ScreenUtil(width: 752, height:1280)..init(context);
 
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
                ButtonLogin(context),
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
        hintText:"请输入您的姓名",
         hintStyle: TextStyle(
            fontSize:ScreenUtil().setSp(36),
            color:Colors.grey,
              ),
      ),
      onChanged: (text) {
  
        
      },
     
    );
  }

 //准考证号输入框
  TextFormField UidText() {
    return TextFormField(
       controller: uidController,
      decoration: InputDecoration(
        hintText:"请输入准考证号",
        hintStyle: TextStyle(
        fontSize:ScreenUtil().setSp(36),
         color:Colors.grey,
    ),
      ),
  
    );
  }
  
  //登录Button
  Widget ButtonLogin(BuildContext context){

      return Align(
          child: SizedBox(
            height: ScreenUtil().setHeight(104),
            width: ScreenUtil().setWidth(600),
            child:
              Material(
          child:  RaisedButton(
              onPressed: () { 
       
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
                          //    Navigator.push(context,
                          //   MaterialPageRoute(builder: (context) => ConfirmInformation()));
                            Navigator.pushNamed(context, '/ConfirmInformation'); 
                      },)
                    ]
                  );
                },

            );
              
              
          }
           
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

Widget alert(BuildContext context){
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
                //    Navigator.push(context,
                //   MaterialPageRoute(builder: (context) => ConfirmInformation()));
                  Navigator.pushNamed(context, '/ConfirmInformation'); 
            },)
          ]
        );
      },

        );
}
  // loadDataByDio(BuildContext context,String name,String id) async {
  //   try {
  //     print('登陆中');
  //     Response response;
  //     Dio dio = new Dio();
  //     print("===================================");
  //     print("https://www.apiopen.top/login?key=00d91e8e0cca2b76f515926a36db68f5&phone=$name&passwd=$id");
  //     response = await dio.get(
  //         "https://www.apiopen.top/login?key=00d91e8e0cca2b76f515926a36db68f5&phone=$name&passwd=$id");
  //     if (response.statusCode == 200) {
  //       _decodeTest(response.data);
  //     } else {
  //       _result = 'error code : ${response.statusCode}';
  //     }
  //   } catch (exception) {
  //     print('exc:$exception');
  //     _result = '网络异常';
  //   }

  //   setState(() {});
  // }