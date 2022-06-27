import 'package:capstone/Calendar/CalendarPage.dart';
import 'package:capstone/MainScreen/GamePage.dart';
import 'package:capstone/MainScreen/HomePage.dart';
import 'package:capstone/MainScreen/MainPage.dart';
import 'package:capstone/MainScreen/Mission/MissionContent.dart';
import 'package:capstone/SplashPage.dart';
import 'package:capstone/auto/Join/JoinPage2.dart';
import 'package:capstone/auto/Login/IntroPage.dart';
import 'package:capstone/auto/Join/JoinPage1.dart';
import 'package:capstone/auto/Join/JoinPage3.dart';
import 'package:flutter/material.dart';
import 'package:capstone/auto/Login/LoginPage.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp(
));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WalkreenApp',
      initialRoute: '/',

      // 페이지 별 route 할당 부분
      routes: {
        '/' : (context) => SplashPage(),
        '/Intro' : (context) => IntroPage(),
        '/Login' : (context) => LoginPage(),
        '/FirstJoin' : (context) => JoinPage1(),
        '/SecondJoin' : (context) => JoinPage2(),
        '/LastJoin' : (context) => JoinPage3(),
        '/Main' : (context) => MainPage(),
        '/Home' : (context) => HomePage(),
        '/Game' : (context) => GamePage(),
        '/Calendar' : (context) => CalendarPage()
      }
    );
  }
}
