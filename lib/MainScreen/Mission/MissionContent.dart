import 'package:flutter/material.dart';

import '../../data/Game_button.dart';

class MissionContentPage extends StatefulWidget {
  const MissionContentPage({Key? key}) : super(key: key);

  @override
  State<MissionContentPage> createState() => _MissionContentPageState();
}

class _MissionContentPageState extends State<MissionContentPage> {
  String a = "컴퓨터 사용 안 할 때 코드 뽑기";
  int joinCount = 10;
  int point = 20;
  String startDate = "시작 날짜";
  String endDate = "끝나는 날짜";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF007F4A),
        title: Text("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t  미션",
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.black //색변경
            ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.0),
            width: 500,
            height: 80,
            child: Row(
              children: [
                SizedBox(
                  width: 20.0,
                ),
                Container(
                  width: 270,
                  child: Text(
                    a,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Image.asset(
                  'images/Earth.png',
                  height: 20,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: 50,
                  child: Text(
                    "${joinCount}명",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            width: 120,
            height: 120,
            child: Image.asset(
              'images/Earth.png',
              width: 120,
              height: 120,
            ),
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              height: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 70.0,
                    child: Text(
                      "내용",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: 300,
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text("북한산에서 플로깅을 진행합니다! 플로깅과 하이킹을 결합한 신개념 환경 보호 활동! " +
                        "우리 플로깅 크루와 함께 흥겨운 하이킹, " +
                        "보람찬 환경보호를 실천해요! 아아아아아아ㅏ앙아아아아아아아아아아아앙아아아아아아ㅏ앙아아아아아아아아아아아앙\n" +
                        "전화번호) 031-8005-xxxx, xxxx"),
                  )
                ],
              )),
          Container(
              padding: EdgeInsets.all(10.0),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 70.0,
                    child: Text(
                      "보상",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: 300,
                    child: Text("${point}점"),
                  )
                ],
              )),
          Container(
              padding: EdgeInsets.all(10.0),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 70.0,
                    child: Text(
                      "시작 시간",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: 300,
                    child: Text("${startDate}"),
                  )
                ],
              )),
          Container(
              padding: EdgeInsets.all(10.0),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 70.0,
                    child: Text(
                      "마감 시간",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: 300,
                    child: Text("${endDate}"),
                  )
                ],
              )),
          SizedBox(
            height: 10.0,
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              height: 70,
              child: GameButton(
                  buttonName: '버튼 이름',
                  onPressed: () {
                    Navigator.pop(context);
                  })),
        ],
      ),
    );
  }
}
