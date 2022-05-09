import 'package:capstone/data/my_button.dart';
import 'package:capstone/data/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

class JoinPage3 extends StatefulWidget {
  const JoinPage3({Key? key}) : super(key: key);

  @override
  State<JoinPage3> createState() => _JoinPage3State();
}

class _JoinPage3State extends State<JoinPage3> {
  bool _isFemaleSwitched = false;
  bool _isMaleSwitched = false;
  DateTime? _selectedDate;

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
                              text: '이제 마지막입니다.\n'
                                  '수고하셨습니다!'),
                          const SizedBox(
                            height: 40.0,
                          ),
                          const Text(
                            '성별',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 20.0,
                              ),
//여자 성별 부분
                              Transform.scale(
                                scale: 1.7,
                                child: Switch(
                                  value: _isFemaleSwitched,
                                  onChanged: (value) {
                                    if (_isMaleSwitched) {
                                    } else {
                                      setState(() {
                                        _isFemaleSwitched = value;
                                      });
                                    }
                                  },
                                  activeTrackColor: Colors.red,
                                  activeColor: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),
                              const Text(
                                '여성',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 120.0,
                              ),
                              //남자 성별 부분
                              Transform.scale(
                                scale: 1.7,
                                child: Switch(
                                  value: _isMaleSwitched,
                                  onChanged: (value) {
                                    if (_isFemaleSwitched) {
                                    } else {
                                      setState(() {
                                        _isMaleSwitched = value;
                                      });
                                    };
                                  },
                                  activeTrackColor: Colors.blue,
                                  activeColor: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),
                              const Text(
                                '남성',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          //생년월일
                          const Text(
                            '생년 월일',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: DatePickerWidget(
                              looping: false,
                              // default is not looping
                              firstDate: DateTime(1950),
                              //DateTime(1960),
                              dateFormat:
                                  // "MM-dd(E)",
                                  "dd/MMMM/yyyy",
                              //     locale: DatePicker.localeFromString('he'),
                              onChange: (DateTime newDate, _) {
                                setState(() {
                                  _selectedDate = newDate;
                                });
                                print(_selectedDate);
                              },
                              pickerTheme: const DateTimePickerTheme(
                                itemTextStyle: TextStyle(
                                    color: Colors.black, fontSize: 19),
                                dividerColor: Colors.blue,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          MyButton(
                              buttonName: '가입하기',
                              onPressed: () {
                                Navigator.pushNamed(context, '/Main');
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
