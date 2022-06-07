import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:capstone/auto/Login/IntroPage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    navigatetohome();
  }

  navigatetohome() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => IntroPage()));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        'images/mainLogo.png',
        width: 300,
      ),
      duration: 3000,
      backgroundColor: Color(0xFFFFFFFF),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: double.maxFinite,
      nextScreen: IntroPage(),
    );
  }
}
