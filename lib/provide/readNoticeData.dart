 
import 'package:flutter/material.dart';
import '../model/tools.dart';
 
class ReadNoticeData with ChangeNotifier{ 
    var noticeData; 
    tools tool=new tools();  
    readNotice(String examId,String type,String name) async{
      tool.readJsonData(examId, type, name)
            .then((val){
              print("#########################################");
              print(val['notice']);
                noticeData=val;
                notifyListeners();
              print("#########################################");
            });
           
        } 
       
         
 
}//