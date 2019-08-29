import 'dart:async';
import 'package:flutter/material.dart';

/**
 * 计时器
 */
class TimerDown with ChangeNotifier{


    //定时器

    //   var Rtime=" ";
    //   Timer timer;
    //   int countdownTime = 7200;
      
    //   String constructTime(int seconds) {//格式化时间
    //       int hour = seconds ~/ 3600;
    //       int minute = seconds % 3600 ~/ 60;
    //       int second = seconds % 60;
    //       return formatTime(hour) + ":" + formatTime(minute) + ":" + formatTime(second);
    //       }
    //   String formatTime(int timeNum) {//格式化显示
    //       return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
    //   }
      
      
    //   void startCountdownTimer() {
    //   const oneSec = const Duration(seconds: 1); 
    //   var callback = (timer) => { 
    //       Rtime=constructTime(countdownTime)};
    //       if (countdownTime < 1) {
    //         timer.cancel();
    //         Rtime=" 考试结束";
    //       } else {
    //         print("====  ${countdownTime.toString()}====");
    //         countdownTime = countdownTime - 1;
    //       }
      
    //   // };

    //   timer = Timer.periodic(oneSec, callback);
    // }
    // @override
    // void dispose() {
    //   super.dispose();
    //   if (timer != null) {
    //     timer.cancel();
    //   }
    // }
    // notifyListeners();
    
  // int index = 0;

  // changeIndex(int newIndex){
  //       index=newIndex;
  //       notifyListeners();
  // }
//        var a;
//      test(){
//         a= timer();
//         notifyListeners();

//      }
   
// }

//  class timer extends StatefulWidget {
//     timer({Key key}) : super(key: key);
  
//     _timerState createState() => _timerState();
//   }
  
//   class _timerState extends State<timer> {
//     @override
//     Widget build(BuildContext context) {
//       return Container(
//          child: Text(_countdownTime.toString()),
//       );
//     }

//      //定时器

//       var Rtime=" ";
//       Timer _timer;
//       int _countdownTime = 7200;
      
//       String constructTime(int seconds) {//格式化时间
//           int hour = seconds ~/ 3600;
//           int minute = seconds % 3600 ~/ 60;
//           int second = seconds % 60;
//           return formatTime(hour) + ":" + formatTime(minute) + ":" + formatTime(second);
//           }
//       String formatTime(int timeNum) {//格式化显示
//           return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
//       }
      
//       void startCountdownTimer() {
//       const oneSec = const Duration(seconds: 1);
//       var callback = (timer) => {
//         setState(() {
//           Rtime=constructTime(_countdownTime);
//           if (_countdownTime < 1) {
//             _timer.cancel();
//             Rtime=" 考试结束";
//           } else {
//             _countdownTime = _countdownTime - 1;
//           }
//         })
//       };

//       _timer = Timer.periodic(oneSec, callback);
//     }
//     @override
//     void dispose() {
//       super.dispose();
//       if (_timer != null) {
//         _timer.cancel();
//       }
//     } 
  }