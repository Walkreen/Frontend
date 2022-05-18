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
  bool _isVisibleNickName = false;
  bool _isNickNameValid = false;
  bool _isNameValid = false;

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
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () {
                                if(_controllerName.text.isNotEmpty) {
                                  _isNameValid = true;
                                }
                                setState(() {
                                  _isNameValid;
                                });
                                if(_isNameValid) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },),
                          const SizedBox(
                            height: 20.0,
                          ),
                          MyTextField(
                            name: '닉네임',
                            text: '닉네임을 입력하세요',
                            keyboard: TextInputType.text,
                            controller: _controllerNickName,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              if (!_isVisibleNickName) {
                                _isVisibleNickName = true;
                              }
                              _isNickNameValid = !_isEmailDuplicated(_controllerNickName.text);
                              setState(() {
                                _isVisibleNickName;
                                _isNickNameValid;
                              });
                              if (_isNickNameValid) {
                                FocusScope.of(context).unfocus();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Visibility(
                            visible: _isVisibleNickName,
                            child: _isNickNameValid ? const Text(
                              '사용 가능한 닉네임입니다.',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.green,
                              ),
                            ) : const Text(
                              '동일한 닉네임 존재합니다.',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          //비밀번호 확인 부분

                          const SizedBox(
                            height: 30.0,
                          ),
                          MyButton(
                              buttonName: '계속하기',
                              onPressed: (_isNameValid && _isNickNameValid)? () {
                                Navigator.pushNamed(context, '/LastJoin');
                              }: null,
                          )
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

  bool _isEmailDuplicated(String text) {
    if (text == "chanho") return false;
    else return true;
  }

}
