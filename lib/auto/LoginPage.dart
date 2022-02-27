import 'package:capstone/data/my_button.dart';
import 'package:capstone/data/my_textField.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controller 선언부분
  TextEditingController controllerID = TextEditingController();
  TextEditingController controllerPWD = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            title: Text(
              '로그인',
              style: TextStyle(color: Color(0xFF036635), fontSize: 25.0),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0.0,
          ),
        ),
        body: GestureDetector(
          //화면의 빈 공간을 클릭하면 키보드가 사라지게 구현
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 50.0)),
                Form(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60.0,
                        ),
                        //아이디 입력 부분
                        MyTextField(
                            name: '아이디',
                            text: '아이디를 입력하시오',
                            keyboard: TextInputType.text,
                            controller: controllerID,),

                        SizedBox(
                          height: 20.0,
                        ),
                        //비밀번호 입력 부분
                        MyTextField(
                          name: '비밀번호',
                          text: '비밀번호를 입력하시오',
                          keyboard: TextInputType.text,
                          controller: controllerPWD,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                ButtonTheme(
                  // 아이디･비밀번호 찾기로 이동하는 페이지
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Finding');
                    },
                    child: Text(
                      '아이디 또는 비밀번호를 잊으셨나요?',
                      style: TextStyle(
                          fontSize: 11.0,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: MyButton(
                      buttonName: '로그인',
                      onPressed: () {
                        if (controllerID.text == 'capstone' &&
                            controllerPWD.text == '1234') {
                        } else if (controllerID.text == 'capstone' &&
                            controllerPWD.text != '1234') {
                          showSnackBar2(context);
                        } else if (controllerID.text != 'capstone' &&
                            controllerPWD.text == '1234') {
                          showSnackBar3(context);
                        } else {
                          showSnackBar(context);
                        }
                      },),
                ),
              ],
            ),
          ),
        ));
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      '로그인 정보를 확인하세요',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Color(0xFF036635),
  ));
}

void showSnackBar2(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      '비밀번호가 일치하지 않습니다.',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Color(0xFF036635),
  ));
}

void showSnackBar3(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        '아이디가 일치하지 않습니다',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Color(0xFF036635)));
}
