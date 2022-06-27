import 'package:capstone/data/Game_button.dart';
import 'package:flutter/material.dart';

import '../api/Config.dart';
import '../api/HttpController.dart';
import '../data/my_button.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  int prePoint = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Color(0xFF007F4A),
          automaticallyImplyLeading: false,
          title: const Center(
              child: Text(
                "내 정보",
                style: TextStyle(fontSize: 22.0),
              )),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 30.0,
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'images/Earth.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              Config.name!,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              Config.birthday!,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          Config.email!,
                          style: TextStyle(
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "닉네임",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              width: 24.0,
                            ),
                            Text(
                              Config.nickname!,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "성별",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              width: 38.0,
                            ),
                            Text(
                              Config.gender == "MALE" ? "남자" : "여자",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ]
              ),

              SizedBox(
                height: 20.0,
              ),

              Column(
                children: <Widget>[
                  Divider(
                      color: Colors.black
                  )
                ],
              ),

              SizedBox(
                height: 30.0,
              ),

              Row(
                children: [
                  SizedBox(
                    width: 30.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "기록",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "누적 포인트",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "총 참여 미션",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "카테고리 별 참여 횟수",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "플로깅",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "분리수거",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "안 쓰는 전원 코드 뽑기",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "메일함 비우기",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "텀블러로 음료 주문",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ]
                          )
                        ]
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "데일리 미션 누적 참여 일수",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
