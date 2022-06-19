import 'package:capstone/data/Game_button.dart';
import 'package:flutter/material.dart';

import '../data/my_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/Earth.png',
                width: 200,
                height: 200,
              ),

              SizedBox(
                height: 100.0,
              ),

              GameButton(
                buttonName: '게임 실행',
                onPressed: () {
                  Navigator.pushNamed(context, '/SecondJoin');
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
