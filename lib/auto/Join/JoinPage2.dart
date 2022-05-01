import 'package:capstone/data/my_button.dart';
import 'package:capstone/data/my_textField.dart';
import 'package:capstone/data/title_text.dart';
import 'package:flutter/material.dart';

class JoinPage2 extends StatefulWidget {
  const JoinPage2({Key? key}) : super(key: key);

  @override
  State<JoinPage2> createState() => _JoinPage2State();
}

class _JoinPage2State extends State<JoinPage2> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerNickName = TextEditingController();
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
                              text: '거의 다 왔습니다.\n'
                                  '조금만 힘내세요!'),
                          const SizedBox(
                            height: 40.0,
                          ),
                          MyTextField(
                              name: '이름',
                              text: '이름을 입력하세요',
                              keyboard: TextInputType.name,
                              controller: _controllerName,
                              focus: true),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            controller: _controllerNickName,
                            decoration: InputDecoration(
                              hintText: '닉네임을 입력하세요',
                              labelText: '닉네임',
                              labelStyle: const TextStyle(color: Colors.black),
                              contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                              suffix: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisible = true;
                                  });
                                },
                                child: const Text(
                                  '중복확인',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFF007F4A),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0))),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(
                                    width: 1, color: Colors.redAccent),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Color(0xFF339E66),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          //비밀번호 확인 부분
                          Visibility(
                            visible: _isVisible,
                            child: const Text(
                              '동일한 닉네임이 존재합니다.',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          // MyTextField(
                          //     name: '닉네임',
                          //     text: '닉네임을 입력하세요',
                          //     keyboard: TextInputType.name,
                          //     controller: _controllerNickName),
                          const SizedBox(
                            height: 30.0,
                          ),
                          MyButton(
                              buttonName: '계속하기',
                              onPressed: () {
                                Navigator.pushNamed(context, '/LastJoin');
                              })
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
