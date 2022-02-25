import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 550.0,
            ),
            ButtonTheme(
              // 로그인 창으로 이동하는 버튼 구현
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Login');
                },
                child: Text(
                  '로그인',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF007F4A),
                  minimumSize: Size(350, 45),
                ),
              ),
            ),
            ButtonTheme(
              // 회원가입창으로 이동하는 버튼 구현
              child: TextButton(
                onPressed: () {},
                child: Text(
                  '회원이 아니신가요?',
                  style: TextStyle(
                      fontSize: 11.0,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
