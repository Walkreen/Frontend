import 'package:capstone/auto/FindingPage.dart';
import 'package:capstone/auto/IntroPage.dart';
import 'package:flutter/material.dart';
import 'package:capstone/auto/LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WalkReenApp',
      initialRoute: '/',

      // 페이지 별 route 할당 부분
      routes: {
        '/' : (context) => IntroPage(),
        '/Login' : (context) => LoginPage(),
        '/Finding' : (context) => FindingPage(),
      }
    );
  }
}
