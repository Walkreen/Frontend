import 'package:capstone/data/my_button.dart';
import 'package:capstone/data/my_textField.dart';
import 'package:capstone/data/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class JoinPage1 extends StatefulWidget {
  const JoinPage1({Key? key}) : super(key: key);

  @override
  State<JoinPage1> createState() => _JoinPage1State();
}

class _JoinPage1State extends State<JoinPage1> {
  late TextEditingController _controllerID;
  late TextEditingController _controllerPW1;
  late TextEditingController _controllerPW2;
  bool _isVisibleEmail = false;
  bool _isVisiblePW1 = false;
  bool _isVisiblePW2 = false;
  bool _isEmailValid = false;
  bool _isPW1Valid = false;
  bool _isPW2Valid = false;
  bool _isButtonValid = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controllerID = TextEditingController();
    _controllerPW1 = TextEditingController();
    _controllerPW2 = TextEditingController();
    _controllerID.addListener(() {
      setState(() {
        _isButtonValid = false;
      });
    });

    _controllerPW1.addListener(() {
      setState(() {
        _isButtonValid = false;
      });
    });

    _controllerPW2.addListener(() {
      setState(() {
        _isButtonValid = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerID.dispose();
    _controllerPW1.dispose();
    _controllerPW2.dispose();
  }

  final validPW = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black //Icon 색변경
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
                              text: '워크린이 처음이신가요?\n'
                                  '지구를 위해 함께해요'),
                          const SizedBox(
                            height: 40.0,
                          ),
                          MyTextField(
                            name: '이메일',
                            text: '이메일을 입력해주세요.',
                            keyboard: TextInputType.emailAddress,
                            controller: _controllerID,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              if (!_isVisibleEmail) {
                                _isVisibleEmail = true;
                              }
                              _isEmailValid = !_isEmailDuplicated(_controllerID.text);
                              _isButtonValid = _isEmailValid && _isPW1Valid && _isPW2Valid;
                              setState(() {
                                _isVisibleEmail;
                                _isEmailValid;
                                _isButtonValid;
                              });
                              if (_isEmailValid) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Visibility(
                            visible: _isVisibleEmail,
                            child: _isEmailValid ? const Text(
                              '사용 가능한 이메일입니다.',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.green,
                              ),
                            ) : const Text(
                              '동일한 이메일이 존재합니다.',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          MyTextField(
                              name: '비밀번호',
                              text: '영문 대소문자, 숫자, 특수문자 포함 8자리 이상',
                              keyboard: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () {
                                final input = _controllerPW1.text;
                                _isPW1Valid = input.length >= 8
                                    && validPW.hasMatch(input);


                                if(_controllerPW1.text != _controllerPW2) {
                                  _isPW2Valid = false;
                                }
                                if (_isPW1Valid){
                                  _isVisiblePW1 = false;
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  _isVisiblePW1 = true;
                                }

                                _isButtonValid = _isEmailValid && _isPW1Valid && _isPW2Valid;
                                setState(() {
                                  _isVisiblePW1;
                                  _isButtonValid;
                                  _isPW2Valid;
                                });

                              },
                              controller: _controllerPW1,
                              obscureText: true),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Visibility(
                            visible: _isVisiblePW1,
                            child: const Text(
                              '잘못된 형식의 비밀번호입니다.',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          MyTextField(
                              name: '비밀번호 재확인',
                              text: '비밀번호를 다시 한번 입력하세요',
                              keyboard: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              onEditingComplete: () {
                                if (_controllerPW2.text.isNotEmpty && (_controllerPW1.text == _controllerPW2.text)) {
                                  _isVisiblePW2 = false;
                                  _isPW2Valid = true;
                                  FocusScope.of(context).unfocus();
                                } else {
                                  _isVisiblePW2 = true;
                                  _isPW2Valid = false;
                                }

                                _isButtonValid = _isEmailValid && _isPW1Valid && _isPW2Valid;

                                setState(() {
                                  _isVisiblePW2;
                                  _isPW2Valid;
                                  _isButtonValid;
                                });
                              },
                              controller: _controllerPW2,
                              obscureText: true),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Visibility(
                            visible: _isVisiblePW2,
                            child: const Text(
                              '비밀번호가 일치하지 않습니다.',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          MyButton(
                            buttonName: '계속하기',
                            onPressed: (_isButtonValid) ? () {
                              Navigator.pushNamed(context, '/SecondJoin');
                            }: null,
                          )],
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

bool _isEmailDuplicated(String text) {
  if (text == "chanho") return false;
  else return true;
}

// void _duplicateCheck(BuildContext context) {
//   showDialog(
//       context: context,
//       //Dialog를 제외한 다른 화면 터치 x
//       barrierDismissible: false,
//       builder: (BuildContext text) {
//         return AlertDialog(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
//           //Dialog 제목
//           title: const Text(
//             '\t이메일이 중복되지 않습니다.\t',
//             style: TextStyle(fontSize: 15.0),
//           ),
//           //Dialog 내용 입력
//           content: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: const [
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Text(
//                   '\t사용 가능한 이메일입니다.\t',
//                   style: TextStyle(fontSize: 15.0),
//                 )
//               ]),
//           actions: [
//             TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('사용하기')),
//             TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('아니요'))
//           ],
//         );
//       });
// }
