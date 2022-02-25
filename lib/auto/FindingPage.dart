import 'package:flutter/material.dart';

class FindingPage extends StatefulWidget {
  const FindingPage({Key? key}) : super(key: key);

  @override
  _FindingPageState createState() => _FindingPageState();
}

class _FindingPageState extends State<FindingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    TextField(
                      //아이디 찾기 부분
                      decoration: InputDecoration(
                        labelText: '이메일',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: '이메일을 입력하세요',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.redAccent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                            width: 1.5,
                            color: Color(0xFF339E66),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
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
                    ButtonTheme(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          '아이디 찾기',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF007F4A),
                          minimumSize: Size(400, 45),
                        ),
                      ),
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
                    TextField(
                      //비밀번호 재설정 부분 - 아이디 입력창
                      decoration: InputDecoration(
                        labelText: '아이디',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: '아이디를 입력하세요',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.redAccent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                            width: 1.5,
                            color: Color(0xFF339E66),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      //비밀번호 재설정 - 이메일 입력 부분
                      decoration: InputDecoration(
                        labelText: '이메일',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: '이메일을 입력하세요',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.redAccent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                            width: 1.5,
                            color: Color(0xFF339E66),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ButtonTheme(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          '비밀번호 재설정',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF007F4A),
                          minimumSize: Size(400, 45),
                        ),
                      ),
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
    );
  }
}
