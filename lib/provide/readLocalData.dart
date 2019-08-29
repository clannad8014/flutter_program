import 'package:flutter/material.dart';
import '../model/tools.dart';
 
class ReadLocalData with ChangeNotifier{ 
    var resData; 
    tools tool=new tools();  
    readData(String examId,String type,String name) async{
      tool.readJsonData(examId, type, name)
            .then((val){
              print("#########################################"); 
                resData=val;
                notifyListeners();
              print("#########################################");
            });
           
        } 
       
         
 
}//