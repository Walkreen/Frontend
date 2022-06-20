import 'package:capstone/api/mission/MissionResponse.dart';
import 'package:flutter/material.dart';

import '../../api/Config.dart';
import '../../api/HttpController.dart';
import '../../data/Game_button.dart';
import '../../data/my_button.dart';

class MissionContentPage extends StatefulWidget {
  final MissionResponse missionResponse;
  final int status;

  const MissionContentPage({Key? key, required this.missionResponse, required this.status}) : super(key: key);

  @override
  State<MissionContentPage> createState() => _MissionContentPageState();
}

class _MissionContentPageState extends State<MissionContentPage> {
  MissionResponse _missionResponse = MissionResponse();

  HttpController _httpController = HttpController();

  String buttonName = "";
  bool isButtonVisible = true;

  String buttonUrl = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _missionResponse = widget.missionResponse;
    if (widget.status == 0) {
      buttonName = "참여하기";
      buttonUrl = Config.baseURL + '/api/mission/join';
    } else if (widget.status == 1) {
      buttonName = "인증하기";
      buttonUrl = Config.baseURL + '/api/mission/submit';
    } else if (widget.status == 2) {
      buttonName = "참여완료";
      isButtonVisible = false;
    }

  }

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
        leading:  //<- leading 항목을 직접 추가
        IconButton(
          icon: Icon(Icons.arrow_back), // <- 아이콘도 동일한 것을 사용
          onPressed: () {
            Navigator.pop(context);     // <- 이전 페이지로 이동.
          },
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
                  width: 240,
                  child: Text(
                    _missionResponse.title!,
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
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
                    "${_missionResponse.people}명",
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: 250,
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      _missionResponse.contents!,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: 250,
                    child: Text("${_missionResponse.reward}점"),
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: 250,
                    child: Text("${_missionResponse.startTime}",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                    )
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: 250,
                    child: Text("${_missionResponse.endTime}",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                    )
                  )
                ],
              )),
          SizedBox(
            height: 10.0,
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              height: 70,
              child: MyButton(
                onPressed: (isButtonVisible)
                ? () {
                  var response;
                  if (widget.status == 0) {
                    response = _httpController.putWithAuthArg(
                        buttonUrl, Config.jwtToken,
                        {
                          'mission': _missionResponse.missionId.toString(),
                        });
                  } else if (widget.status == 1) {
                    response = _httpController.postWithAuthArg(
                        buttonUrl, Config.jwtToken,
                        {
                          'mission': _missionResponse.missionId.toString(),
                        });
                  }
                  response.then((value) {
                    if (value == null) {
                    } else {
                      _missionResponse = MissionResponse.fromJson(value);
                    }}).catchError((error) {
                    print('error : $error');
                  });
                  setState(() {
                    isButtonVisible = false;
                  });
              } : null,
                buttonName: buttonName,
              )
          ),
        ],
      ),
    );
  }
}
