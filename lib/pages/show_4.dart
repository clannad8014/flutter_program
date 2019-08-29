import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:async';
import 'dart:convert';
import '../model/tools.dart';
import '../model/resultList.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/resultList.dart';
import 'dart:convert' as convert;
import '../model/tools.dart';

class showResult extends StatelessWidget {
  // const showResult({Key key}) : super(key: key); showResult
  //  final String goodsId;
  // DetailsPage(this.goodsId);
  // List list=[];
  final String result;
     showResult(this.result);
  @override
  Widget build(BuildContext context) {
    var list = List<int>();
    ///字符串解码
    jsonDecode(result).forEach(list.add);
    var value = Utf8Decoder().convert(list);
       print(value);
    var valJson = json.decode(value);
    print(valJson['result'][0]["pic"]);
    resultList resultlist=resultList.fromJson(valJson); 
    print(resultlist.result_list[0].url);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 20),
      child: ListView(
        children: <Widget>[
            Container(
                  height: 120.0,  
                  child: Image.network(spit_img(resultlist.result_list[0].pic)),//封面
                  alignment: FractionalOffset.center,
                ),
           Container(
                  height: 120.0,  
                  child: Image.network('https://i.loli.net/2018/03/25/5ab72ab70ace2.jpg'),//封面
                  alignment: FractionalOffset.center,
                ),
                //  Container(
                //     child: new Image.file(  File("/Users/gs/Downloads/1.jpeg")),
                //   ),
                RaisedButton(
                  onPressed: (){
                    // tools tool=new tools();
                    // tool.getCachePath();
                    // print(tool.getCachePath().toString());
                    print("#####");
                  },
                   child: Text("测试"),
                ),
          Text(value,style: TextStyle(fontSize: 23,color: Colors.black12),),
        ],
      )
    );
  }
}

String spit_img(String img){//截取图片
            List<String> ReImg = img.split("?param=");
            return ReImg[0];
          }
// class showResult extends StatefulWidget {
//   showResult({Key key}) : super(key: key);

//   _showResultState createState() => _showResultState();
// }

// class _showResultState extends State<showResult> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//        child: child,
//     );
//   }
// }