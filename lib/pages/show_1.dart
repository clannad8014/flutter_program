import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:async';
//=====================================
import '../utils/HttpUtil.dart';
import 'package:http/http.dart' as http;
import '../config/httpHeader.dart';
import 'package:program/config/httpHeader.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/category.dart';
import 'package:flutter/services.dart';
import '../provide/child_cateage.dart';
import 'package:provide/provide.dart';
import '../model/resultList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:image/image.dart' as img;
import '../model/MyNetworkImage.dart';
import 'dart:convert' as convert;
import '../routers/application.dart';
import '../model/tools.dart';

import './Api.dart';
import './ApiTest.dart';
//解析html
import './Login.dart';

// import 'package:html/parser.dart' show parse;
// import 'package:html/dom.dart';
class Show_1 extends StatefulWidget {

  _Show_1State createState() => _Show_1State();
}

// 读取 json 数据
readJSON() async {
    try {
       print("正在读入文件。。。。。。。。。");
        final file = await localFile(await localPath());
        String str = await file.readAsString();
        return json.decode(str);
    }
    catch (err) {
        print(err);
    }
}

// 写入 json 数据
writeJSON(obj) async{
    try {
      print("正在写入文件。。。。。。。。。");
        final file = await localFile(await localPath());
        return file.writeAsString(json.encode(obj));
    }
    catch (err) {
        print(err);
    }
}

//获取文件存储目录
 localPath() async {
    try {
        var tempDir = await getTemporaryDirectory();
        String tempPath = tempDir.path;

        var appDocDir = await getApplicationDocumentsDirectory();
        String appDocPath = appDocDir.path;

        print('临时目录: ' + tempPath);
        print('文档目录: ' + appDocPath);
        return tempPath;
    }
    catch(err) {
        print(err);
    }
}
localFile(path) async {
    return new File('$path/counter.json');
}

//缓存图片
 _fetchImage(String url,String name) async {
    final res = await http.get(url);
    print("+++++ url");
    final image = img.decodeImage(res.bodyBytes);

    Directory appDocDir = await getApplicationDocumentsDirectory();
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path; // 临时文件夹
    String appDocPath = appDocDir.path; // 应用文件夹

    String images="${appDocPath}/temp/images/${name}.png";
    File file_image=File(images);
    var flag=await file_image.exists();
    if(flag==true){
        print("该文件已存在,正在覆盖。。。");
           var file=File(images);
           await file.writeAsBytes(img.encodePng(image)); // 需要使用与图片格式对应的encode方法
           print(file.path);
           print(file.statSync());
     }else{
          print("该文件不存在,正在创建目录。。。");
           File(images).create(recursive: true)
          .then((file) {
            print(file.path);
            return file;
          }).then((file) async{
                  await file.writeAsBytes(img.encodePng(image)); // 需要使用与图片格式对应的encode方法
                  print(file.path);
                print(file.statSync());
          });
     }
   

    // getFileBytes(String url);
  }
   
   Future creatFile(String path){
     return  new File('${path}/temp/images').create(recursive: true)
        .then((file) {
          print(file.path);
          file.exists().then(print);
          return file.path;
        });
        
   }
class _Show_1State extends State<Show_1> {
     final String mUserName = "userName";
    final _userNameController = new TextEditingController();
     String _Result="22";
  @override
  Widget build(BuildContext context) {   
    ScreenUtil.instance = ScreenUtil(width: 750, height:1624)..init(context);
    save() async{
      SharedPreferences spf=await SharedPreferences.getInstance();
      spf.setString(mUserName, _userNameController.value.text.toString());
    }
      Future<String> get() async {
      var userName;
        SharedPreferences prefs = await SharedPreferences.getInstance();
         userName = prefs.getString(mUserName);
      return userName;
    }
    localPath();
   
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Future与FutureBuilder实用技巧'),
        ),
 
        body: Container(
            child: Column(
              children: <Widget>[
                     TextField(
                      controller: _userNameController,
                      decoration:  InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 10.0),
                          icon:  Icon(Icons.perm_identity),
                          labelText: "请输入用户名",
                          // helperText: "注册时填写的名字"
                          ),
                    ),
                   test(),
                    RaisedButton(
                      onPressed: (){
                            Application.router.navigateTo(context,'/show_2?resultlist=2');
                      },
                      child:Text("show_2")
                    ),
                      RaisedButton(
                      onPressed: (){
                            String name="ssaaq";
                            final url = 'http://p2.music.126.net/tpqIHupzaqlFaHawnUYlOA==/18722483998223156.jpg';
                           _fetchImage(url,name);
                      },
                      child:Text("缓存图片")
                    ),
                      RaisedButton(
                      onPressed: (){
                          //  MaterialPageRoute(builder: (context) => ConfirmInformation()));
                           Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context)=>Api()
                      ));
                      },
                      child:Text("APi测试")
                    ),
                      RaisedButton(
                      onPressed: (){
                          //  MaterialPageRoute(builder: (context) => ConfirmInformation()));
                           Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context)=>ApiTest()
                      ));
                      },
                      child:Text("APi逻辑梳理")
                    ),
                      Text(_Result),
                      BuilderData(),
                         RaisedButton(
                      onPressed: (){
                        var timestamp=1566268200;
                      timeShow(timestamp);
                      timeShow(1566268300);
                      print("##### 1 "+timeShow(1566268200));
                      print("##### 2 "+timeShow(1567132200));
                      tools tool=new tools();
                         setState(() {
                           

                         });
                      },
                      child:Text("接口数据测试")
                    ),
                    Text(notes),

              ],
            ),
        ),
      ),
    );
  }
  String notes="";
  String timeShow(var timestamp){
       var  date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
          String Y = date.year.toString() + '-';
          String M = (date.month+1 < 10 ? '0'+(date.month+1).toString() : date.month+1).toString() + '-';
          String D = date.day.toString()+ ' ';
          String h = date.hour < 10 ? ('0' + date.hour.toString() + ':') : (date.hour.toString()  + ':');
          String m = date.minute < 10 ? ('0' + date.minute.toString()) : (date.minute).toString();
          // print(Y+M+D+h+m); 
          return (Y+M+D+h+m);
  }
    void Timer() async{
          await Future.delayed(Duration(seconds: 1), () {
             
                 print("延时一秒后请求数据");
                 setState(() {
                        // _Result="qqqq"; 
                            var read=readJSON();
                                    read.then((var read){
                               print("############ setState ReadJSON ##################");
                                      list=read;
                                print(read['result'][0]['link']);
                                 print(" ## ## "+read['result'][0]['title']);  
                                     _Result=read['result'][0]['title'];
                                     
                                     print(" ## ## "+list['result'][0]['author']);  
                               print("############ setState ReadJSON  ################## END");
                            
                             
                            });
                 });

            });
    }
     void getList(String title) async{
      // var data={
      //     'name':'BadBlood'
      // };
      var data='name='+title;
      print("+++++++++++++++++=====");
      await request('https://api.apiopen.top/searchMusic',formData: data).then((val){
           print(val);
            var valJson = json.encode(val);
          Map<String, dynamic> Valdata=json.decode(valJson);
          writeJSON(Valdata);
          resultList res=resultList.fromJson(Valdata);
          print(res.result_list[0].url);
           saveData(val.toString());
            getResult2(res);
      });
      
  }
  Widget BuilderData(){
       if(_Result.length>3){
          return    Container(
                    height: ScreenUtil().setHeight(660),
                    width: ScreenUtil().setWidth(570),
                    child: BuildTest(),
                  );
        }else{
          return Text("正在加载。。。");
         
        }
  }

   Widget BuildTest(){
    return Column(
        children: <Widget>[
       
          new Expanded(
            child: new ListView.builder
              (
              itemCount: (list== null) ? 0 : list.length,
              itemBuilder: (BuildContext context, int position) {
                  return getItem(position); }
              )
        )
        ],
      );
  } 

  //SharedPreferences存储和读取
  var ruseltMusic="ruseltMusic";
     void saveData(String result) async{
       print("=================");
        SharedPreferences spf=await SharedPreferences.getInstance();
        spf.setString(ruseltMusic, result);
     }
       Future<String> getResult() async {
        SharedPreferences spf= await SharedPreferences.getInstance();
        var result;
         result = spf.getString(ruseltMusic);
      return result;
    }
    //SharedPreferences存储
    var result2;
       Future<String> getResult2(var value) async {
        SharedPreferences spf= await SharedPreferences.getInstance();
        var result;
        //  result = spf.getString(ruseltMusic);
      //    print("====== r2 =======");
      //   result=spf.setStringList(result2, value);
        
      //   print("====== r2 =======");
      //   print(spf.getStringList(result2));
      // return result;
    }

        String spit_img(String img){//截取图片
            List<String> ReImg = img.split("?param=");
            return ReImg[0];
          }

        tools tool=new tools();
    //获取数据
    void getRessultList(String title) async{
      var data='name='+title;
      print("+++++++++++++++++=====");
      await request('https://api.apiopen.top/searchMusic',formData: data).then((val){
           print(val);  print("+++++++++++++++++=====");
            var valJson = json.encode(val);
          Map<String, dynamic> Valdata=json.decode(valJson);
          //写入json文件
          // tool.writeJSON(Valdata,title);
          resultList res=resultList.fromJson(Valdata);
           tool.writeJSON(res,title);
          print(res.result_list[0].pic);
           
      });
      
  }

      Widget test(){
        return Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                   
              ],
            ),
            Column(//https://hellorfimg.zcool.cn/manager/avatar/6d0147440a62fc85c949da396846b2d7.jpeg?x-oss-process=image/resize,h_400
              children: <Widget>[
                Container(
                  height: ScreenUtil().setHeight(300),
                  width:ScreenUtil().setWidth(300),  
                  child: Image.network('http://p2.music.126.net/tpqIHupzaqlFaHawnUYlOA==/18722483998223156.jpg'),//封面
                  alignment: FractionalOffset.center,
                )
              ],
            ),
            Column(
              children: <Widget>[
                  RaisedButton(
                        color: Colors.blueAccent,
                        child: Text("测试"),
                        onPressed: () {
                          // localFile( localPath());
                          // _fetchImage();

                          // save();
                          print("##############3333333 测试");
                           print(list.toString());
                          //  List test=[22,33,222,22];
                          // getRessultList(_userNameController.text.toString());
                          print(list['result'][0]['author']);
                           //======================
                          //  String jsonString = json.encode(list.toString());
                          var jsonString = convert.jsonEncode(list);
                           var jsons = jsonEncode(Utf8Encoder().convert(jsonString));
                          Application.router.navigateTo(context,'/resultShow?resultlist=${jsons}');

                          //=========解析数据========================
                          //  var read=readJSON();
                          //           read.then((var read){
                          //      print("############ setState ReadJSON ##################");
                          //      print(read);
                          //             list=read;
                          //       print(read['result'][0]['link']);
                          //        print(" ## ## "+read['result'][0]['title']);  
                          //            _Result=read['result'][0]['title'];
                                     
                          //            print(" ## ## "+list['result'][0]['author']);  
                          //      print("############ setState ReadJSON  ################## END");
                            
                             
                          //   });
                        }),
                    RaisedButton(
                        color: Colors.blueAccent,
                        child: Text("存储"),
                        onPressed: () {
                          // localFile( localPath());
                          // _fetchImage();

                          // save();
                          //  Application.router.navigateTo(context,'/detail?id=${_userNameController}');
                          getRessultList(_userNameController.text.toString());
                          Application.router.navigateTo(context,'/detail2?id=${_userNameController.value.text.toString()}');
                        }),
                    RaisedButton(
                        color: Colors.greenAccent,
                        child: Text("获取"),
                        onPressed: () {
                          //获取 shared_Preference保存的数据
                          // Future<String> userName = get();
                          // userName.then((String userName) {
                          //   print(userName);
                          // });
                        
                            // var read=readJSON();
                            // read.then((var read){
                            //    print("############  ReadJSON ##################");
                            //     print(read['result'][0]['link']);
                            //      print(" ## ## "+read['result'][0]['title']);
                            //    print("############  ReadJSON  ################## END");
                             
                            // });
                            
                            //搜索
                            getList(_userNameController.text);
                              setState(() {  
                                //  Timer();
                             
                               });
                               print("#####################1");
             Future.delayed(const Duration(seconds:2), () => Timer());
                             print("#####################2");
             Future.delayed(const Duration(seconds:1), () => print('2秒后在Event queue中运行的Future'));
                               print("#####################3");
                          //  Future<String> result = getResult();
                          // result.then((String result1) {
                          //   print("############  Readresult1 ##################");
                          //     print(result1);
                             
                          //     var valJson = json.encode(result1);
                          //      print("################ 1");
                          //     // Map<String, dynamic> Valdata=json.decode(valJson);
                          //     print("################ 2");
                          //     // resultList res=resultList.fromJson(Valdata);

                          //     var data1=json.decode(valJson);
                          //     print("################ 2.9");
                          //     // var res1=resultList.fromJson(data1);
                          //     // print("################ 3");
                          //     // print(res1.result_list[0].url);
                          // });
                        }

                        ),
              ],
            ),
          ],
        );
      } 
      var list;
      //======================
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
                        child: Image.network(spit_img(list['result'][index]['pic'])),//封面
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
                                list['result'][index]['title'],//标题
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              alignment: FractionalOffset.topLeft,
                            ),
                            new Container(
                              child: new Text("${list['result'][index]['link']}",//概要
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
                                      child: new Text("${list['result'][index]['author']}",
                                          style: new TextStyle(fontSize: 10.0)),//作者
                                      alignment: FractionalOffset.bottomLeft,
                                    ),
                                    new Container(
                                      child: new Text("${list['result'][index]['songid']}",
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
      //=====================
     
}//class _Show_1State


//=========================

class FileImageEx extends FileImage {
  int fileSize;
  FileImageEx(File file, { double scale = 1.0 })
      : assert(file != null),
        assert(scale != null),
        super(file, scale: scale) {
    fileSize = file.lengthSync();
  }

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType)
      return false;
    final FileImageEx typedOther = other;
    return file?.path == typedOther.file?.path
        && scale == typedOther.scale && fileSize == typedOther.fileSize;
  }

}