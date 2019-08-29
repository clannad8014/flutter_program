import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamView extends StatefulWidget {
  ExamView({Key key}) : super(key: key);

  _ExamViewState createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
         body:  Container(
                width: ScreenUtil().setWidth(1280),
                // height: ScreenUtil().setHeight(752),
                  decoration: BoxDecoration(
                  color: Color.fromRGBO(216,216,216,1),
              ),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(1280),
                      height: ScreenUtil().setHeight(100),
                    )
                  ],
                )
         )
      )
    );
  }

    Widget content(){
        return Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[

                    ],
                  ),
                ),

                Container(
                  child: Column(
                    children: <Widget>[
                      
                    ],
                  ),
                ),
              ],
            ),
        );
    }
}