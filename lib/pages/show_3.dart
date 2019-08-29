import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:async';
import 'dart:convert';
import '../model/tools.dart';
import '../model/resultList.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DetailsPage extends StatelessWidget {
  final String goodsId;
  DetailsPage(this.goodsId);
  List list=[];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height:1624)..init(context);
    // return Container(
    //   child:Text('商品ID为：${goodsId}')
      
    // );
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Future与FutureBuilder实用技巧'),
        ),
        body: Container(
            child: Column(
              children: <Widget>[
                   RaisedButton(
                        color: Colors.blueAccent,
                        child: Text("写入数据"),
                        onPressed: () {
                            getList(goodsId);
                        }),
                    RaisedButton(
                        color: Colors.blueAccent,
                        child: Text("读取数据"),
                        onPressed: () {
                          readResult();
                          }),
                         Text('歌曲名：${goodsId}'),
                      content(),
                //  Text('歌曲名：${goodsId}'),
//http://p2.music.126.net/dWEvW58DeXO_iSmJLg12AQ==/2506886511389199.jpg
                    // Container(
                    // width:ScreenUtil().setWidth(400),
                    // height: ScreenUtil().setHeight(300),
                    //           child: Image.network('http://p2.music.126.net/dWEvW58DeXO_iSmJLg12AQ==/2506886511389199.jpg'),
                    //       )
              ]
            ),
          )
         )
        );
  }
    void readResult(){
      
           var read=tool.readJSON(goodsId);
            read.then((var read){
                    var valJson = json.encode(read);
                    Map<String, dynamic> valdata=json.decode(valJson);
                    resultList result=resultList.fromJson(valdata);
                    print(result.result_list[1].url);
                    list=result.result_list;
                    print(list[1].url);
                  
                    // print(spit_img(list[0].pic));
                  });
    }
    Widget content(){
      print("##########################33333");
      if(list.length>2){
          return getItem(1);
      }else{
        print(list.length.toString());
        return Text("加载中");
      }
    }
    Widget _MusicImage(int index){
        return Container(
            child: Image.network(spit_img(list[index].pic)),
        );
    }
    tools tool=new tools();
    //获取数据`
    void getList(String title) async{
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
  
  String spit_img(String img){//截取图片
      List<String> ReImg = img.split("?param=");
      return ReImg[0];
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
                        child: Image.network(spit_img(list[index].pic)),//封面
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
                                list[index].title,//标题
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              alignment: FractionalOffset.topLeft,
                            ),
                            new Container(
                              child: new Text("${list[index].link}",//概要
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
                                      child: new Text("${list[index].author}",
                                          style: new TextStyle(fontSize: 10.0)),//作者
                                      alignment: FractionalOffset.bottomLeft,
                                    ),
                                    new Container(
                                      child: new Text("${list[index].songid}",
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
}

// class initInfo extends StatefulWidget {
//   // final String goodsId;
//   // DetailsPage(this.goodsId);
//   // List list=[];
//   initInfo({Key key, this.goodsId}) : super(key: key);
//   final goodsId

//   _initInfoState createState() => _initInfoState();
// }

// class _initInfoState extends State<initInfo> {
//   List list=[];
//   tools tool=new tools();
//   @override
//   Widget goodsId;
//   Widget build(BuildContext context) {
//     return Container(
//       //  child: child,
//     );
//   }

//   void read(){
//      var read=tool.readJSON(goodsId);
//       read.then((var read){
//               var valJson = json.encode(read);
//               Map<String, dynamic> valdata=json.decode(valJson);
//               resultList result=resultList.fromJson(valdata);
//               print(result.result_list[1].url);
//               list=result.result_list;
//               print(list[1].url);
            
//               // print(spit_img(list[0].pic));
//             });
  
//   }
// }
