import 'package:capstone/data/my_button.dart';
import 'package:capstone/data/my_textField.dart';
import 'package:capstone/data/title_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  TextEditingController _controllerID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all((20)),
                child: Form(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 100.0,
                        ),
                        TitleText(
                            text: '지구를 위한 발걸음\n'
                                '그 첫 단계입니다!'),
                        const SizedBox(
                          height: 300.0,
                        ),
                        MyButton(
                            buttonName: '로그인',
                            onPressed: () {
                              _loginToast();
                              Navigator.pushNamed(context, '/Login');
                            }),

                        Center(
                          child: TextButton(
                              onPressed: () {
                                _joinToast();
                                Navigator.pushNamed(context, '/FirstJoin');
                              },
                              child: const Text(
                                '회원이 아니신가요?',
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline),
                              )),
                        ),

                        //kakaoTak oauth 처리 부분 - 필요하면 넣기
                        //
                        // //실선 부분
                        // SizedBox(
                        //   height: 25.0,
                        // ),
                        // Divider(thickness: 1, color: Color(0xDEDEDEDE)),
                        // SizedBox(
                        //   height: 25.0,
                        // ),
                        //
                        // //카카오톡 버튼 만들기
                        // ButtonTheme(
                        //   child: ElevatedButton(
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //       children: [
                        //         Image.asset(
                        //           'images/klogo.png',
                        //           height: 50.0,
                        //           width: 50.0,
                        //         ),
                        //         Text(
                        //           '카카오 로그인',
                        //           style: TextStyle(
                        //               color: Colors.black,
                        //               fontSize: 18.0,
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //         Opacity(
                        //           opacity: 0.0,
                        //           child: Image.asset(
                        //             'images/klogo.png',
                        //             height: 50.0,
                        //             width: 50.0,
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //     style: ElevatedButton.styleFrom(
                        //         primary: Color(0xfffeea0d),
                        //         minimumSize: Size(100, 45),
                        //         shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(16.0))),
                        //     onPressed: () {},
                        //   ),
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(16.0))),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _loginToast() {
  Fluttertoast.showToast(
      msg: '로그인 창으로 이동합니다',
      gravity: ToastGravity.BOTTOM,
      //toast 위치 지정
      backgroundColor: const Color(0xFF036635),
      fontSize: 20.0,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}

void _joinToast() {
  Fluttertoast.showToast(
      msg: '회원가입 창으로 이동합니다',
      gravity: ToastGravity.BOTTOM,
      //toast 위치 지정
      backgroundColor: const Color(0xFF036635),
      fontSize: 20.0,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}
