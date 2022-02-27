import 'package:capstone/data/my_button.dart';
import 'package:capstone/data/my_textField.dart';
import 'package:flutter/material.dart';

class FindingPage extends StatefulWidget {
  const FindingPage({Key? key}) : super(key: key);

  @override
  _FindingPageState createState() => _FindingPageState();
}

class _FindingPageState extends State<FindingPage> {
  //controller 선언부분
  TextEditingController controllerID = TextEditingController();
  TextEditingController controllerPWD1 = TextEditingController();
  TextEditingController controllerPWD2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Form(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '아이디 찾기',
                        style:
                            TextStyle(fontSize: 30.0, color: Color(0xFF036635)),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      //아이디 찾기 부분
                      MyTextField(
                        name: '이메일',
                        text: '이메일을 입력하세요',
                        keyboard: TextInputType.emailAddress,
                        controller: controllerID,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '일치하는 회원정보가 없습니다.',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),

                      //아이디 찾기 버튼 부분
                      MyButton(
                        buttonName: '아이디 찾기',
                        onPressed: () {},
                      ),

                      //실선 부분
                      SizedBox(
                        height: 25.0,
                      ),
                      Divider(thickness: 4, color: Color(0xFF339E66))
                    ],
                  ),
                ),
              ),

              // 비밀번호 찾기 부분
              Form(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '비밀번호 재설정',
                        style:
                            TextStyle(fontSize: 30.0, color: Color(0xFF036635)),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      //비밀번호 재설정 부분 - 아이디 입력창
                      MyTextField(
                        name: '아이디',
                        text: '아이디를 입력하세요',
                        keyboard: TextInputType.text,
                        controller: controllerPWD1,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      //비밀번호 재설정 - 이메일 입력 부분
                      MyTextField(
                        name: '이메일',
                        text: '이메일을 입력하세요',
                        keyboard: TextInputType.emailAddress,
                        controller: controllerPWD2,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      //비밀번호 재설정 버튼
                      MyButton(
                        buttonName: '비밀번호 재설정',
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 10.0,
                      )
                    ],
                  ),
                ),
              ),
              Text(
                '링크가 발송되었습니다.',
                style: TextStyle(color: Colors.blue[900], fontSize: 12.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
