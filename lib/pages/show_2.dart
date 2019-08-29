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
import '../model/resultList.dart';
import 'package:flutter/services.dart';
//proide
import '../provide/child_cateage.dart';
import '../provide/MusicList.dart';
import 'package:provide/provide.dart';

class Show_2 extends StatefulWidget {
  Show_2({Key key}) : super(key: key);

  _Show_2State createState() => _Show_2State();
}
 
class _Show_2State extends State<Show_2> {
    var listIndex=0;
    var index=1;
    var _fetchPost;
    List list=[];
    
  Future<CategoryModle> _getData() async {
       await request("https://api.apiopen.top/musicRankings").then((val){
         print('开始获取数据1111...............');
           var valJson = json.encode(val);
          Map<String, dynamic> Valdata=json.decode(valJson);
          CategoryModle cate=CategoryModle.fromJson(Valdata);

             print(cate.result[0].content[0].title);
                print('list#######################');
                list =cate.result;
               print(list[0].content[0].title);
            //    setState(() {
            //       list=cate.result;
            // });
            Provide.value<ChildCateage>(context).getChildCateage(list[0].content);
              
             return list;
       });
  }
      void getList(String name) async{
          // var data={
          //     'name':'BadBlood'
          // };
          var data='name=${name}';
          print("+++++++++++++++++=====");
          await request('https://api.apiopen.top/searchMusic',formData: data).then((val){
                var valJson = json.encode(val);
              Map<String, dynamic> Valdata=json.decode(valJson);
              resultList res=resultList.fromJson(Valdata);
              print(res.result_list[0].url);

              Provide.value<MusicListProvide>(context).getMusicList(res.result_list);
          });
      }
  @override
  void initState() {
     _fetchPost=_getData();
    super.initState();
   
  }
  
  @override
  Widget build(BuildContext context) {
      ScreenUtil.instance = ScreenUtil(width: 750, height:1624)..init(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Future与FutureBuilder实用技巧'),
        ),
 
        body: Container(
          
            child: ListView(
              children: <Widget>[
               new Image.file(  File("/data/user/0/flutter.example.program/app_flutter/temp/images/ssaaq.png")),
               Image(image: FileImageEx(File("/data/user/0/flutter.example.program/app_flutter/temp/images/ssaaq.png"))),
                  BuilderData(),
                  SizedBox(height:20),
                  MusicList(),
                  // new Image.file(  File("/Users/gs/Downloads/1.jpeg")),
              ],
            ),
        ),
      ),
    );
  }

  //======================================


    Widget BuildTest(){
    return Column(
        children: <Widget>[
       
          new Expanded(
            child: new ListView.builder
              (
              itemCount: (list== null) ? 0 : list[0].content.length,
              itemBuilder: (BuildContext context, int position) {
                  return getItem(position); }
              )
        )
        ],
      );
  } 

  Widget BuilderData(){
     return   FutureBuilder<CategoryModle>(
            future: _fetchPost,
            builder:
                (BuildContext context, AsyncSnapshot<CategoryModle> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return new Text('Input a URL to start');
                case ConnectionState.waiting:
                  return new Center(child: new CircularProgressIndicator());
                case ConnectionState.active:
                  return new Text('');
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return new Text(
                      '${snapshot.error}',
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    
                    return new Row(children: <Widget>[
                      
                      // Text('icon:${list[0].content[0].title}'),  
                        Container(
                          width: ScreenUtil().setWidth(180),
                          height: ScreenUtil().setHeight(700),
                          child: listNews()
                           ),
                        Column(
                          children: <Widget>[
                            Provide_title(),
                               Container(
                                height: ScreenUtil().setHeight(660),
                                width: ScreenUtil().setWidth(570),
                                child: BuildTest(),
                              ),
                              //  MusicList(),
                          ],
                        ),
                       
                    ]);
                    //====================================
                    
                  }
              }
            });
  }
  Widget listNews(){
    return  ListView.builder(
              itemCount: (list== null) ? 0 : list.length,
              itemBuilder: (BuildContext context, int position) {
                    
                     return _leftInkWel(position);
                
              });
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


 
}//class _Show_2State

  String spit_img(String img){//截取图片
     List<String> ReImg = img.split("@");
     return ReImg[0];
   }

class Provide_title extends StatefulWidget {
  Provide_title({Key key}) : super(key: key);

  _ProvideState createState() => _ProvideState();
}
var musicList;
class _ProvideState extends State<Provide_title> {
  // List list=['名酒','清酒','葡萄酒','啤酒','威士忌','鸡尾酒'];
     
     void getList(String name) async{
          // var data={
          //     'name':'BadBlood'
          // };
          var data='name=${name}';
          print("+++++++++++++++++=====");
          await request('https://api.apiopen.top/searchMusic',formData: data).then((val){
                var valJson = json.encode(val);
                print(valJson);
              Map<String, dynamic> Valdata=json.decode(valJson);
              resultList res=resultList.fromJson(Valdata);
              print(res.result_list[0].url);
               musicList=res;
               print(res.result_list[0].author);
              // Provide.value<MusicListProvide>(context).getMusicList(res.result_list);
          });
      }
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
      onTap: (){
        print(item.title);
        if(item.title!='全部'){
           getList(item.title);
        }
        
        //  var musicName=musicList.
      },
      child: Container(
        padding:EdgeInsets.fromLTRB(5, 10, 5, 10),
          child: Text(
            item.title,
            style:TextStyle(fontSize: ScreenUtil().setSp(28))
          ),
        ),
      );
   }
   

}//


class MusicList extends StatefulWidget {

  _MusicListState createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  @override
  void initState() {
    // getList();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    // getList();
    return  Container(
        width: 600,
        height:200,
        child: ListView(
            scrollDirection: Axis.horizontal,
          children: <Widget>[
             
            Row(
              children: <Widget>[
                Bottom(),
                Text("############################################## "),
                Text("############################################## "),
               
              ],
            )
          ],
        )
      );
  }
  Widget Bottom(){
    try{
        if( musicList.length>0 && musicList!=null){
            return Text("加载中。。。");
          }else{ print("#### ######");
            return BuildRightTest();
          }
    }catch(e){
      return Text("加载中。。。");
    }
 
}
  Widget BuildRightTest(){
    return Provide<MusicListProvide>(
       builder:(context,child,data){
          return  Column(
              children: <Widget>[
            
                new Expanded(
                  child: new ListView.builder
                    (
                    // itemCount: (list== null) ? 0 : list[0].content.length,
                    itemCount: data.childContList.length,
                    itemBuilder: (BuildContext context, int position) {
                        return getRightItem(data.childContList,position); }
                    )
              )
              ],
            );
       }
    );
   
  } 
Widget getRightItem(List newList,int index){
    
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
                        child: Image.network(spit_img(newList[0].content[index].picBig)),//封面
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
                                newList[0].content[index].title,//标题
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              alignment: FractionalOffset.topLeft,
                            ),
                            new Container(
                              child: new Text("${newList[0].content[index].albumTitle}",//概要
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
                                      child: new Text("${newList[0].content[index].author}",
                                          style: new TextStyle(fontSize: 10.0)),//作者
                                      alignment: FractionalOffset.bottomLeft,
                                    ),
                                    new Container(
                                      child: new Text("${newList[0].content[index].songId}",
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
//===================================
  void getList() async{
      // var data={
      //     'name':'BadBlood'
      // };
      var data='name=BadBlood';
      print("+++++++++++++++++=====");
      await request('https://api.apiopen.top/searchMusic',formData: data).then((val){
            var valJson = json.encode(val);
          Map<String, dynamic> Valdata=json.decode(valJson);
          resultList res=resultList.fromJson(Valdata);
          print(res.result_list[0].url);
      });
  }
}



//===========================

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