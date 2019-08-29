import 'package:flutter/material.dart';
import '../model/category.dart';

//ChangeNotifier的混入是不用管理听众
class ChildCateage with ChangeNotifier{
   List<Content> childContList=[];

  // getChildCateage(List list){
  //   childContList=list;
  //   notifyListeners();
  // }

  //加上 ‘全部’
   getChildCateage(List<Content> list){
     Content all=Content();
      all.songId='00';
      all.rankChange='00';
      all.biaoshi='00';
      all.author='00';
      all.albumId='00';
      all.picSmall='00';
      all.title='全部';
      all.picBig='00';
      all.albumTitle='00';

    childContList=[all];
    childContList.addAll(list);
    notifyListeners();
  }
}

