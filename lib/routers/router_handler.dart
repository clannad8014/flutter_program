import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/show_2.dart';
import '../pages/show_3.dart';
import '../pages/show_4.dart';
Handler detailsHander =Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    String goodsId = params['id'].first;
    return DetailsPage(goodsId);

  }
);

Handler resultHander =Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    // List result =  params['resultlist'];
    String result = params['resultlist'].first;
    return showResult(result);
     
  }
);

Handler Show_2Handel =Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    // String show = params['resultlist'].first;
    return Show_2();
     
  }
);