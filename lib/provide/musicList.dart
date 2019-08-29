import 'package:flutter/material.dart';
import '../model/resultList.dart';

//ChangeNotifier的混入是不用管理听众
class MusicListProvide with ChangeNotifier{
   List<Result_list> childContList=[];
   getMusicList(List<Result_list> list){
     
    notifyListeners();
  }
}

