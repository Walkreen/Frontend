import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 50.0)),
              Form(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        //아이디 입력 부분
                        decoration: InputDecoration(
                          labelText: '아이디',
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: '아이디를 입력하시오',
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.redAccent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFF339E66),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextField(
                        //비밀번호 입력 부분
                        decoration: InputDecoration(
                          labelText: '비밀번호',
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: '비밀번호를 입력하시오',
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.redAccent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFF339E66),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '아이디 또는 비밀번호가 일치하지 않습니다.',
                        style: TextStyle(color: Colors.red, fontSize: 10.0),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
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
              ButtonTheme(
                // 로그인 버튼 구현
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    '로그인',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF007F4A),
                    minimumSize: Size(350, 45),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
