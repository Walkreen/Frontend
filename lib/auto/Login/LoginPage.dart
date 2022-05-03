import 'package:capstone/data/my_button.dart';
import 'package:capstone/data/my_textField.dart';
import 'package:capstone/data/title_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controller 선언부분
  TextEditingController _controllerPWD = TextEditingController();
  TextEditingController _controllerID = TextEditingController();
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black //색변경
            ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all((20)),
            child: Form(
              child: Container(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 70.0,
                        ),
                        TitleText(
                            text: '다시 돌아오셨군요!\n'
                                '지구를 위해 함께해요'),
                        const SizedBox(
                          height: 30.0,
                        ),
                        MyTextField(
                            name: '이메일',
                            text: '이메일를 입력하세요',
                            keyboard: TextInputType.emailAddress,
                            controller: _controllerID,
                            focus: true,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        //비밀번호 입력 부분
                        MyTextField(
                            name: '비밀번호',
                            text: '비밀번호를 입력하세요',
                            keyboard: TextInputType.text,
                            controller: _controllerPWD,
                            obscureText: true),
                        const SizedBox(
                          height: 10.0,
                        ),
                        //비밀번호 확인 부분
                        Visibility(
                          visible: _isVisible,
                          child: const Text(
                            '비밀번호가 일치하지 않습니다.',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        MyButton(
                            buttonName: '로그인',
                            onPressed: () {
                              if (_controllerPWD.text != '1234') {
                                setState(() {
                                  _isVisible = true;
                                });
                              } else {
                                Navigator.pushNamed(context, '/Home');
                              }
                            }),
                        const SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          _resetPwdDialog(context);
                        },
                        child: const Text(
                          '비밀번호를 잊으셨나요?',
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//비밀번호 재설정 DiaLog 함수
void _resetPwdDialog(BuildContext context) {
  showDialog(
      context: context,
      //Dialog를 제외한 다른 화면 터치 x
      barrierDismissible: false,
      builder: (BuildContext text) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          //Dialog 제목
          title: const Text('비밀번호 재설정'),
          //Dialog 내용 입력
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircleAvatar(
                backgroundImage:
                AssetImage('images/password.png'), //이미지를 원형 형태로 불러옴
                radius: 40.0,
                backgroundColor: Colors.white,//이미지 크기 조절// 이미지 배경 색 설정
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('등록된 이메일로 임시 비밀번호가 발송됩니다.',
              style: TextStyle(
                fontSize: 12.0
              ),)
              ]
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('ok')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('cancel'))
          ],
        );
      });
}
