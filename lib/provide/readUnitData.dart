 
import 'package:flutter/material.dart';
import '../model/tools.dart';
 
class ReadUnitData with ChangeNotifier{ 
    var unitData; 
    tools tool=new tools();  
    readQuestion(String examId,String type,String name) async{
      tool.readJsonData(examId, type, name)
            .then((val){
              print("#########################################"); 
                unitData=val;
                notifyListeners();
              print("#########################################");
            });
           
        } 
       
         
 
}//