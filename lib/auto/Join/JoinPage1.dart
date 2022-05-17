import 'package:capstone/data/my_button.dart';
import 'package:capstone/data/my_textField.dart';
import 'package:capstone/data/title_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class JoinPage1 extends StatefulWidget {
  const JoinPage1({Key? key}) : super(key: key);

  @override
  State<JoinPage1> createState() => _JoinPage1State();
}

class _JoinPage1State extends State<JoinPage1> {
  final TextEditingController _controllerID = TextEditingController();
  final TextEditingController _controllerPW1 = TextEditingController();
  final TextEditingController _controllerPW2 = TextEditingController();
  bool _isVisible = false;
  bool _isEmailValid = false;

  // nextEditableTextFocus
  void nextEditableTextFocus() {
    do {
      FocusScope.of(context).nextFocus();
    } while (FocusScope.of(context).focusedChild?.context?.widget is! EditableText);
  }

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
                          TextFormField(
                            onEditingComplete: () {
                              if (!_isVisible) {
                                _isEmailValid =
                                    _duplicateCheck(_controllerID.text);
                                _isVisible = true;
                              }
                            },
                            controller: _controllerID,
                            decoration: InputDecoration(
                              hintText: '이메일을 입력하세요',
                              labelText: '이메일',
                              labelStyle: const TextStyle(color: Colors.black),
                              contentPadding: const EdgeInsets.all(10.0),
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
                            autofocus: true,
                          ),
                          Visibility(
                            visible: _isVisible,
                            child: const Text(
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
                              text: '특수문자 포함 8자리 이상 입력하세요',
                              keyboard: TextInputType.text,
                              controller: _controllerPW1,
                              obscureText: true
                              ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          MyTextField(
                              name: '비밀번호 재확인',
                              text: '비밀번호를 다시 한번 입력하세요',
                              keyboard: TextInputType.text,
                              controller: _controllerPW2,
                              obscureText: true
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          MyButton(
                              buttonName: '계속하기',
                              onPressed: () {
                                if (_controllerPW1.text !=
                                    _controllerPW2.text) {
                                  showToast1();
                                } else {
                                  Navigator.pushNamed(context, '/SecondJoin');
                                }
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

void showToast1() {
  Fluttertoast.showToast(
      msg: '비밀번호가 서로 다릅니다.',
      gravity: ToastGravity.BOTTOM,
      //toast 위치 지정
      backgroundColor: Color(0xFF036635),
      fontSize: 20.0,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}

bool _duplicateCheck(String text) {

  // String message;
  // MaterialColor messageColor;
  // if (text == null) {
  //   message = "이미 존재하는 이메일입니다";
  //   messageColor = Colors.red;
  // }
  // else {
  //   message = "사용 가능한 이메일입니다";
  //   messageColor = Colors.green;
  // }
  //
  // return Text(
  //     message,
  //     style: TextStyle(
  //         color: messageColor,
  //         fontSize: 10
  //     )
  // );
  return true;
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
