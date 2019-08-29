import 'dart:core';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:program/pages/loginViewTest.dart';
import 'pages/view/Login.dart';
import 'pages/view/ConfirmInformation.dart';
import 'pages/view/SelectTest.dart';
import 'pages/view/CandidateInstruction.dart';
import 'pages/view/SelectType.dart';
import 'pages/view/Exam.dart';
import 'pages/view/ExamEnd.dart';
import 'dart:async';
//=====================================
import 'pages/show_1.dart';
import 'pages/show_2.dart';
import 'utils/HttpUtil.dart';
import 'package:http/http.dart' as http;
import 'config/httpHeader.dart';
import 'package:program/config/httpHeader.dart';
import 'service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'model/test.dart';
import './model/category.dart';
import 'package:flutter/services.dart';
//provide
import './provide/child_cateage.dart';
import './provide/musicList.dart';
import 'package:provide/provide.dart';

import 'package:fluro/fluro.dart';
import './routers/routes.dart';
import './routers/application.dart';

import './provide/showView.dart';
import './provide/loginPost.dart';
import './provide/readNoticeData.dart';
import './provide/readQuestionData.dart';
import './provide/timerDown.dart';
import './provide/readLocalData.dart';

void main(){
  // runApp(TestApp());
  var childCateage=ChildCateage();
  var musicList=MusicListProvide();
  //=========================
  var switchView=SwitchView();
  var loginPost=LoginPost();
  var readNoticeData=ReadNoticeData();
  var readQuestionData=ReadQuestionData();
  var readLocalData=ReadLocalData();
  var timerDown=TimerDown();
  var provides=Providers();


  provides
  ..provide(Provider<SwitchView>.value(switchView))
  ..provide(Provider<LoginPost>.value(loginPost))
  ..provide(Provider<ReadNoticeData>.value(readNoticeData))    
  ..provide(Provider<ReadQuestionData>.value(readQuestionData)) 
  ..provide(Provider<ReadLocalData>.value(readLocalData)) 
  ..provide(Provider<TimerDown >.value(timerDown))   
//============================
  ..provide(Provider<ChildCateage>.value(childCateage))
  ..provide(Provider<MusicListProvide>.value(musicList));

  runApp(ProviderNode(child:TestApp(),providers:provides));
}

class TestApp extends StatelessWidget {
  
  @override
  
  Widget build(BuildContext context) {
    //注入路由
    final router =Router();
    Routes.configureRoutes(router);
    Application.router=router;

    return MaterialApp(
      onGenerateRoute: Application.router.generator,  //配置路由信息
        debugShowCheckedModeBanner: false,  
    //  home: Login(),
    // home: DioTest(),
    // home: Showtext(),
    // home: HomePage(),
    //  home: gradview(),
    home:Show_1(),
     routes: {
       '/Login':(context) =>Login(),  //登录界面
       '/ConfirmInformation':(context) =>ConfirmInformation(), //确认信息
       '/CandidateInstruction':(context) =>CandidateInstruction(),  //考生须知
       '/SelectTest':(context) =>SelectTest(),  //选择试题
       '/SelectType':(context) =>SelectType(),  //选题
       '/Exam':(context) =>Exam(),  //考试中
       '/ExamEnd':(context) =>ExamEnd(),  //考试结束
     }
    
    );
  }
}

  getProgressDialog() {
  // // CircularProgressIndicator是一个圆形的Loading进度条
    return new Center(child: new CircularProgressIndicator());
  }
//============================================
class DioTest extends StatefulWidget {
   

  _DioTestState createState() => _DioTestState();
}

class _DioTestState extends State<DioTest> {
  String _date="````";
  String showText="你就是我的Master吗";
  TextEditingController TypeController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.white,
      child:Scaffold(
        body: SingleChildScrollView(
            child:  Container(
           child: Column(
         children: <Widget>[
           SizedBox(height: 40,),
           FlatButton(
             onPressed: ()async{
              //  getHttp();
              final post={
                  "title":'hello',
                  "description":'先有圣人后有天',
              };
              final postJson=json.encode(post);
              print(postJson);
              final postJsonCoverted=json.decode(postJson);
               print(postJsonCoverted["title"]);

               
                http.Response res = await http.get("https://cn.bing.com");
                      print(res.body); // 打印出get请求返回的字符串数据
                print("==================");
                 String _tet="===";
               Dio dio=new Dio();
                 Response response = await dio.get("https://h5.ele.me/restapi/shopping/v2/entries?latitude=39.90469&longitude=116.407173&templates[]=main_template&templates[]=favourable_template&templates[]=svip_template&terminal=h5");
                       
                 try {
                       // print(response);
                        print(response.statusCode);
                        print("==================");
                        print(response.data);
                        _tet=response.data;
                      } catch (e) {
                        print("----------------");
                        print(e);
                        _tet=e.toString();
                      }
                      setState(() {
                        print("----------------"+response.toString());
                        _date=_tet;
                        _date=response.data.toString();
                      });
                   
             },
             child: Text("发起Http请求 "),
             color: Colors.blue,
           ),
           TextField(
              controller: TypeController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: '召唤英灵',
                helperText: "请选择要召唤的英灵"
              ),
             autofocus:false, //关闭键盘
           ),
            FlatButton(
             onPressed: ()async{
               getHttp();
               _choice();
             },
             child: Text("召唤英灵 "),
             color: Colors.blue,
           ),
           Text(
             showText,
             overflow:TextOverflow.ellipsis,//超出隐藏

             ),
           Scrollbar(
             child: Container(
                height: 200,
                width: 400,
                child: Text(_date),
             ),
           )
         ],
       )
        ),
    )
      ) ,
        );
  }

  void getHttp() async {
  try {
    Response response = await Dio().get("https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=冬马和纱");
    print(response);
    print(response.data);
    // final postModle=post.fromJsoon(json)
  } catch (e) {
    print("**********************");
    print(e);
    print("**********************");
  }
} 
  void _choice(){
    print("请选择你要召唤的英灵：");
    if(TypeController.text.toString()==""){
      showDialog(
        context: context,
        builder:(context)=>AlertDialog(
          title: Text("召唤不能为空"),
        )
      );
    }else{
      gethttp(TypeController.text.toString()).then((val){
          setState(() {
                  showText= val['data']['name'].toString();
          });
      });
    }
  }
  Future gethttp(String TypeText)async {
    try {
      var data={'name':TypeText};
      Response response = await Dio().post("https://www.easy-mock.com/mock/5d424b45b105fd6fbb96a4e4/clannad/flutterTest",
            queryParameters: data
      );
      print(response);
      print(response.data);
      return response.data;
      // final postModle=post.fromJsoon(json)
    } catch (e) {
      print("**********************");
      print(e);
      print("**********************");
    }
  }
}

class Showtext extends StatefulWidget {
  Showtext({Key key}) : super(key: key);

  _ShowtextState createState() => _ShowtextState();
}

class _ShowtextState extends State<Showtext> {
   String showtext="你就是我的Master吗";
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(title:Text("请求远程数据")),
         body:SingleChildScrollView(
           child:Column(
             children: <Widget>[
               RaisedButton(
                 onPressed: (){
                    _jike();
                 },
                 child:Text("请求数据"),
               ),
               Text(showtext),
        //       FutureBuilder(
        //    future: getHttp(),
        //    builder: (context,snapshot){
        //      if(snapshot.hasData){
        //        print("************************************** 1");
        //        var data=json.decode(snapshot.data.toString());
        //        List<Map> swiper =(data['result']['url'] as List).cast();
        //        print("************************************** 2");
        //        return Column(
        //          children: <Widget>[
        //            SwiperDiy(swiperDateList: swiper)
        //          ],
        //        );
        //      }else{
        //        return Center(
        //          child: Text("加载中......"),
        //        );
        //      }
        //    }
        //  ),

             ],
           )
         )
       ),
    );
  }
  void _jike(){
     print("请求数据：");
     getHttp().then((val){
       setState(() {
         showtext=val['results'].toString();
       });
         
     });
  }
  Future getHttp() async{
    try{
      Response res;
      Dio dio=new Dio();
      dio.options.headers= httpHeader1;
      res=await dio.get("https://gank.io/api/data/福利/10/1");
      
         String  leaderImage= res.data['data']['url']; 
print(leaderImage);
      // Response response = await Dio().get("https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=冬马和纱");
       print(res.data);
       return res.data;
    }catch(e){
      print(e);
        return e;
    }

  }
}


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homepageContent="正在获取数据...";
  
  @override
  void initState() {
   getMusicThing().then((val){
          setState(() {
             homepageContent=val.toString();
             print(homepageContent);
          });
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("1  ====================================================");
    // get();
    _loadMemberJson();
    print("2  ====================================================");
    // _request();
    return Container(
       child: Scaffold(
         appBar: AppBar(title: Text("获取数据"),),
         body: Container(
           child: Column(
             children: <Widget>[
                _request(),
             ],
           )
     
         ),
       ),
    );
  }


  
    Widget  _request(){
      print('开始请求数据..................');
      var res;
        getHttp().then((val){
            // print(val['results'].toString());
            res=val['results'];
            
            // print(res[0]);
            // print(res[1]);
            print(res[0]["url"]);
            print('#######################1');
            for(var i=0; i < res.length; i++){
              print('#######################'+res[i]["url"]);
              swiperDateList[i]=res[i]["url"];
              
            }
            print('#######################2');
            for(var country in swiperDateList){
              print(country);
            }
            print(res.length.toString()+' #######################4');
            print(res[0]["url"]);
          // setState(() {
          //   print('=========..................end');
          //    for(var i=0; i < res.length; i++){
          //     swiperDateList.add(res[i]);
          //   }
          //  showText=val['results'].toString();
            
          // });
        });
          return SwiperDiy();
  }
  
  Future getHttp()async{
     try{
      Response response;
      Dio dio = new Dio(); 
      response =await dio.get("https://gank.io/api/data/福利/10/1");
       String name = json.encode(response.data);
      //  print("      ==        "+name);
  //解析字符串
    Map<String, dynamic> user = json.decode(name);
    // print("code：${user['results']}");
    //  print("      ==1        ");
    // print("msg：${user['error']}");
    // print("data：${user['data']}");
    // print("      ==2  2      ");
    // // print("['data']['tech']：${user['results']['url'][0]}");
    // print("      ==3        ");
     print("['data']['tech']['picInfo']：${user['results'][0]["url"]}");
     print("['data']['tech']['picInfo']：${user['results'][1]["url"]}");
     print("['data']['tech']['picInfo']：${user['results'][2]["url"]}");
    
       print('.....................................');
      // print(response.data);
       print('///////////////////////////////////////');
      // Map<String, dynamic> user = jsonDecode(response.data);
      //   print('QQQQQQQQQQQQQQQQQQQQQQQQQQQ');
      // print('Howdy, ${user['img']}!');
      return response.data;
    }catch(e){
      return print(e);
    }
  }

  
}

//============================
  Future<String> _loadMemberJson() async {
     var response = await http.get("http://www.wanandroid.com/tree/json");
        // Data data = BaseResp<Data>(response.body, (res) => Data.fromJson(res)).data;
  // return await rootBundle.loadString('assets/member.json');
  return response.body.toString();
}

Future<Data> decodeMemberList() async {
  String memberListJson = await _loadMemberJson();

  List<dynamic> list = json.decode(memberListJson);

  Data memberList = Data.fromJson(list);
print("++++++++++++++++++++++");
      print(memberList);
  // memberList.memberList
  //     .forEach((member) => print('member name is ${member.name}'));

  return memberList;
}


//==========================
var swiperDateList = new List(10);
//===========================
//首页轮播组件
class SwiperDiy extends StatelessWidget {
    
  
  // const SwioerDiy({Key key,this.swiperDateList}) : super(key: key);
  // SwiperDiy({this.swiperDateList});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
 
    return Container(
      height: ScreenUtil().setHeight(800),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          // print(list[index]);
          return Image.network("${swiperDateList[index]}" ,);
            //  return new Image.network(swiperDateList[1].toString(),fit: BoxFit.fill,);
        },
        itemCount:10,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}


//================================
class Login2 extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login2> {
  final _formKey = GlobalKey<FormState>();
  String _user, _password;
  bool _isObscure = true;
  Color _eyeColor;
  var _result = '';
  var _decodeResult = '';
  loadDataByDio() async {
    try {
      print('登陆中');
      Response response;
      Dio dio = new Dio();
      print("===================================");
      String str="https://www.apiopen.top/login?key=00d91e8e0cca2b76f515926a36db68f5&phone=$_user&passwd=$_password";
      response = await dio.get(str);
      print(str);
      print(response.data);
          print("response.statusCode   "+response.statusCode.toString());
      if (response.statusCode == 200) {
        print("连接成功");
        _decodeTest(response.data);
        
      } else {
        print("失败"+_result );
        _result = 'error code : ${response.statusCode}';
        print(_result );
      }
    } catch (exception) {
      print('exc:$exception');
      _result = '网络异常';
    }

    setState(() {});
  }

  _decodeTest(var body) {
     print("**============="+body['msg']+body['data'].toString());
    bool usertxt = body['success'];
    String errMess = body['msg'];
     print("-------------------"+body['success']);
      print("============="+errMess);
    if (usertxt == false) {
      _modalBottomSheetMenu(errMess);
      print("============="+errMess);
    } else {
      print("**============="+errMess);
      // Navigator.of(context).pushAndRemoveUntil(
      //     new MaterialPageRoute(builder: (context) => Login()),
      //     (route) => route == null);
    }
  }

  _modalBottomSheetMenu(errMess) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: 50.0,
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.grey,
                ),
                child: new Center(
                  child: new Text(errMess,style: TextStyle(color: Colors.white),),
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Container(
                decoration: new BoxDecoration(
                  color: Colors.blueAccent,
                  image: new DecorationImage(
                      image: new AssetImage('images/shebei_bg.png'),
                    
                      fit: BoxFit.fill),
                ),
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  children: <Widget>[
                    SizedBox(
                      height: 100.0,
                    ),
                    buildTitle(),
                    SizedBox(height: 70.0),
                    buildUserTextField(),
                    SizedBox(height: 10.0),
                    buildPasswordTextField(context),
                    buildForgetPasswordText(context),
                    SizedBox(height: 10.0),
                    buildLoginButton(context),
                  ],
                ))));
  }

  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: RaisedButton(
          child: Text(
            '登录',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          color: Color.fromARGB(255, 64, 200, 176),
          // onPressed: _loadDataByDio,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              //只有输入的内容符合要求通过才会到达此处
              print("开始登陆");
              _formKey.currentState.save();
              loadDataByDio();
            }
          },
          shape: StadiumBorder(side: BorderSide.none),
        ),
      ),
    );
  }

  Container buildForgetPasswordText(BuildContext context) {
    return Container(
        width: 500,
        padding: const EdgeInsets.only(top: 3.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: FlatButton(
                child: Text(
                  '注册帐号',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                onPressed: () {
                  // Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   new MaterialPageRoute(builder: (context) => Login()),
                  // );

                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(128, 2, 0, 0),
              child: FlatButton(
                child: Text(
                  '忘记密码',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                onPressed: () {
                  // Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   new MaterialPageRoute(
                  //       builder: (context) => Login()),
                  // );
                },
              ),
            ),
          ],
        ));

        Widget gridViewItemUI(){
            return InkWell(
              onTap: (){},
              child: Column(
                children: <Widget>[

                ],
              ),
            );
        }
  }

  TextFormField buildPasswordTextField(BuildContext context) {
    return TextFormField(
      onSaved: (String value) => _password = value,
      obscureText: _isObscure,
      validator: (String value) {
        if (value.isEmpty) {
          return '请输入密码';
        }
      },
      style: TextStyle(color: Colors.black, fontSize: 18.0),
      cursorColor: Colors.white,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 13),
          hintText: '密码',
          hintStyle: TextStyle(color: Colors.white, fontSize: 18.0),
         
          suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = _isObscure
                      ? Color.fromARGB(255, 166, 166, 166)
                      : Color.fromARGB(255, 41, 41, 41);
                });
              })),
    );
  }

  TextFormField buildUserTextField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return '请输入用户名';
        }
      },
      style: TextStyle(color: Colors.white, fontSize: 18.0),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 13),
        hintText: '账号',
        hintStyle: TextStyle(color: Colors.white, fontSize: 18.0),
        
      ),
      onSaved: (String value) => _user = value,
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: EdgeInsets.all(8.0),
    
    );
  }
}


class gradview extends StatefulWidget {

  _gradviewState createState() => _gradviewState();
}

class _gradviewState extends State<gradview> {
  List list=[];
  var listIndex = 0;
  // @override
  // void initState() {
  //   getCategory();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
      //  getCategory();
      // print
   
    Container MusuicTest=new Container(
       child: Container(
          child: Scaffold(
            body:Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: ScreenUtil().setHeight(88),),
                     FlatButton(
                       onPressed: (){
                           getCategory();
                       },
                     child: Text("获取数据"),
                     ),
                      
                     Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: <Widget>[
                      //  _leftInkWel(0),
                      //  listNews_2(),
                     
                       Column(
                         children: <Widget>[
                          //  Provide_title(),
                            //  listNews_1(),
                         ],
                       )
                       ],
                     ),
                  ],
                ),
            )
          ),
       ),
    );
  
        if(list !=null ||list.length<=0 ){
           print("加载中。。。。");
             return Container(
           child:Scaffold(
             body:Column(
                children: <Widget>[
                  SizedBox(height: 50,),
                  Text("ssssa")
                ],
             )
           )
         );
            // getProgressDialog();
       }else{
           print("------------------ end ----------------------------------");
          // print("####  #### list: "+list.length.toString());
        //  return MusuicTest;
         return Container(
           child:Text("sssss")
         );
       }
  }

  
  Widget listNews_1(){
    var listview1=new Container(
      width: ScreenUtil().setWidth(500),
      height: ScreenUtil().setHeight(600),
      child:   ListView.builder(
              itemCount: (list== null) ? 0 : list[0].content.length,
              itemBuilder: (BuildContext context, int position) {
                if(list.length>0){
                  return getItem(position);
                }else{
                   print("###### listNews_1加载中。。。。。。 #####");
                  // getProgressDialog();
                }
                
                // return _leftInkWel(0);
              }),
    );

    return listview1;
    //  if (list.isEmpty ||list== null || list.length==0) {
    //   return getProgressDialog();
    // }else{
    //   return listview1;
    // }
 }

   Widget listNews_2(){
    var listview2=new Container(
            width: ScreenUtil().setWidth(180),
            height: ScreenUtil().setHeight(600),
            child:  ListView.builder(
                itemCount: (list== null) ? 0 : list.length,
                itemBuilder: (BuildContext context, int position) {

                     if(list.length>0){
                         return _leftInkWel(position);
                    }else{
                      print("###### listNews_2加载中。。。。。。 #####");
                          // getProgressDialog();
                     }
            
                  
                }),
      );

         return listview2;
      // if (list.isEmpty ||list== null || list.length==0) {
      //   return getProgressDialog();
      // }else{
      //   return listview2;
      // }
 }
   
   Widget getItem(int index){
    
      return Padding(
            padding: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: new Column(
              children: <Widget>[

                new Row(
                  crossAxisAlignment: CrossAxisAlignment.start, //纵向对齐方式：起始边对齐
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Expanded(
                      child: Container(
                        height: 95.0,
                        child: Image.network(spit_img(list[0].content[index].picBig)),//封面
                        alignment: FractionalOffset.center,
                      ),
                      flex: 1,
                    ),
                    new Expanded(
                      child: Container(
                        height: 95.0,
                        margin: new EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                              child: new Text(
                                list[0].content[index].title,//标题
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              alignment: FractionalOffset.topLeft,
                            ),
                            new Container(
                              child: new Text("${list[0].content[index].albumTitle}",//概要
                                  style: new TextStyle(fontSize: 16.0),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis),
                              alignment: Alignment.topLeft,
                            ),
                            new Expanded(
                              child: new Container(
                                margin:
                                    new EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                                child: new Stack(
                                  children: <Widget>[
                                    new Container(
                                      child: new Text("${list[0].content[index].author}",
                                          style: new TextStyle(fontSize: 10.0)),//作者
                                      alignment: FractionalOffset.bottomLeft,
                                    ),
                                    new Container(
                                      child: new Text("${list[0].content[index].songId}",
                                          style: new TextStyle(fontSize: 10.0)),//时间
                                      alignment: FractionalOffset.bottomRight,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      flex: 3,
                    ),
                  ],
                ),
                new Divider(), //分割线
              ],
            ),
          );
  }
  
   String spit_img(String img){//截取图片
     List<String> ReImg = img.split("@");
     return ReImg[0];
   }
  
   Widget _leftInkWel(int index){
      bool isClick=false;
    isClick=(index==listIndex)?true:false;

      return InkWell(
        onTap: (){
          setState(() {
              listIndex=index; 
          });
          var childList=list[index].content;
          Provide.value<ChildCateage>(context).getChildCateage(childList);
        },
        child: Container(
          height: ScreenUtil().setHeight(120),
          padding:EdgeInsets.only(left:10,top:20),
          decoration: BoxDecoration(
            color: isClick?Colors.lightBlue:Colors.white,
            border:Border(
              bottom:BorderSide(width: 1,color:Colors.black12)
            )
          ),
          child: Text(list[index].name,style: TextStyle(fontSize:ScreenUtil().setSp(28)),),
        ),
      );
  }

  getBody() {
  if (list.isEmpty) {
      return getProgressDialog();
    } else {
      return new Container(
        padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
        child: _leftInkWel(3),
      );
    }
  }
  

 void getCategory() async{
 
     Response response;
      Dio dio = new Dio();
      print("#############################1");
      
       await request("https://api.apiopen.top/musicRankings").then((val){
                
         print('开始获取数据1111...............');
           var valJson = json.encode(val);
          Map<String, dynamic> Valdata=json.decode(valJson);
          CategoryModle cate=CategoryModle.fromJson(Valdata);

             print(Valdata['result'][0]['color']);
             print(Valdata['result'][0]['content'][0]['title']);
              print('#############..............');
            for(int i=0;i<=4;i++){
              cate.result[i].content.forEach((item){
                              print(item.author+" -- "+item.title);
                              // list
                 });
            }
          

             print(cate.result[0].content[0].title);
             print('....................');
            // cate.result.forEach((item){
            // print(item.content[1].title);
            //   });
                print('list#######################');
                list =cate.result;
              //  print(cate.result[0].content[0].title);
               print(list[0].content[0].title);
               print(list[0].bgPic);
               print('list end#######################');
  //另一个list版本： list=cate.result[0].content
              //  print(list[0].content[0].title);
               List lits=cate.result[0].content;
               print("###lits:  "+lits[0].author);
                print("###lits:  "+list.length.toString());
                 print("###lits:  "+list[1].name);
                // var img=list[0].content[0].picBig;
                // print("###lits:  "+list['bg_pic']);

              //  for(var i=0;i<cate.result.length;i++){
              //       for(var j=0;j<cate.result[i].content.length;j++){
              //             print(cate.result[i].content[j].title);
              //       }
              //  }
               setState(() {
                  list=cate.result;
            });
            // Provide.value<ChildCateage>(context).getChildCateage(list[0].title);
             
       });
   
  
}
}

class Provide_title extends StatefulWidget {
  Provide_title({Key key}) : super(key: key);

  _ProvideState createState() => _ProvideState();
}

class _ProvideState extends State<Provide_title> {
  // List list=['名酒','清酒','葡萄酒','啤酒','威士忌','鸡尾酒'];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<ChildCateage>(
        builder: (context,child,childCateage){
          return Container(
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(500),
              decoration: BoxDecoration(
                  border: Border(
                    bottom:BorderSide(width: 1,color: Colors.black12)
                  )
              ),
              child:ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: childCateage.childContList.length,
                itemBuilder: (context,index){
                  return _rightInlwell(childCateage.childContList[index]);
                 },
          )
        );
      },
    )
  );
}

Widget _rightInlwell(Content item){
      return InkWell(
      onTap: (){},
      child: Container(
        padding:EdgeInsets.fromLTRB(5, 10, 5, 10),
          child: Text(
            item.title,
            style:TextStyle(fontSize: ScreenUtil().setSp(28))
          ),
        ),
      );
   }

}