 
import 'package:flutter/material.dart';
import '../model/tools.dart';
 
class ReadQuestionData with ChangeNotifier{ 
    var questionData; 
    tools tool=new tools();  
    readQuestion(String examId,String type,String name) async{
      tool.readJsonData(examId, type, name)
            .then((val){
              print("#########################################"); 
                questionData=val;
                notifyListeners();
              print("#########################################");
            });
           
        } 
       
         
 
}//