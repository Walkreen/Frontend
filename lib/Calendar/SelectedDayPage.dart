import 'package:capstone/api/calendar/DayResponse.dart';
import 'package:flutter/material.dart';

import '../../api/Config.dart';
import '../../api/HttpController.dart';
import '../MainScreen/Mission/MissionContent.dart';

class SelectedDayPage extends StatefulWidget {
  final DateTime today;

  const SelectedDayPage({Key? key, required this.today}) : super(key: key);

  @override
  State<SelectedDayPage> createState() => _SelectedDayPageState();
}

class _SelectedDayPageState extends State<SelectedDayPage> {
  DayResponse _dayResponse = DayResponse();
  HttpController _httpController = HttpController();
  List<String?> titleList = [];
  List<int?> rewardList = <int>[];
  List<bool?> doneList = <bool>[];
  int listLength = 5;

  final String url = Config.baseURL + '/api/mission/get?status=DONE';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    titleList.add("페트병 라벨 떼기");
    rewardList.add(5);
    doneList?.add(true);

    titleList.add("출퇴근 시 걷기나 자전거 타기");
    rewardList.add(15);
    doneList?.add(false);

    titleList.add("쓰레기 배출 양 기록하기");
    rewardList.add(10);
    doneList?.add(false);

    titleList.add("하루 30분 불 끄기");
    rewardList.add(15);
    doneList?.add(true);

    titleList.add("일회용 비닐봉투 안 받기");
    rewardList.add(10);
    doneList?.add(false);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: Color(0xFF007F4A),
            automaticallyImplyLeading: true,
            title: const Center(
                child: Text(
                  "캘린더\t\t\t\t\t\t\t\t\t\t",
                  style: TextStyle(fontSize: 22.0),
                )),
          ),
        ),
        body: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 30),
            itemCount: listLength,
            separatorBuilder: (BuildContext context, int index) =>
            const Divider(thickness: 3),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: SingleChildScrollView(
                  child: Container(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20.0,
                          ),
                          Image.asset(
                            'images/Earth.png',
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Container(
                            width: 210,
                            child: Text(
                                "${titleList[index]}",
                                style: TextStyle(fontSize: 15)
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            width: 50,
                            child: Text(
                              "${rewardList[index]}P",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.5),
                              shape: BoxShape.circle,
                              color: Color(0xFF73BA77),
                            ),
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  doneList[index]! ? "v" : "",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              );
            }));
  }
}