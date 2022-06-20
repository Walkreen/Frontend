import 'package:flutter/material.dart';

import '../../api/Config.dart';
import '../../api/HttpController.dart';
import '../../api/mission/MissionResponse.dart';
import '../../api/mission/PageMissionResponse.dart';
import 'MissionContent.dart';

class InProgressedPage extends StatefulWidget {
  const InProgressedPage({Key? key}) : super(key: key);

  @override
  State<InProgressedPage> createState() => _InProgressedPageState();
}

class _InProgressedPageState extends State<InProgressedPage> {
  PageMissionResponse _pageMissionResponse = PageMissionResponse();
  HttpController _httpController = HttpController();
  List<String?> titleList = [];
  List<int?> rewardList = <int>[];
  int listLength = 0;
  MissionResponse _missionResponse = MissionResponse();

  final String url = Config.baseURL + '/api/mission/get?status=GOING';
  final String buttonUrl = Config.baseURL + '/api/mission/submit?mission=';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var response = _httpController.httpGetWithAuth(url, Config.jwtToken);
    response.then((value) {
      if (value == null) {
      } else {
        _pageMissionResponse = PageMissionResponse.fromJson(value);
        _pageMissionResponse.missions?.forEach((element) {
          print(element.toString());
          titleList.add(element.title);
          rewardList.add(element.reward);
        });
        setState(() {
          listLength = titleList.length;
        });
      }}).catchError((error) {
      print('error : $error');
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

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
                            width: 220,
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
                        ],
                      )),
                ),
                onTap: () {
                  var response = _httpController.postWithAuth(
                      buttonUrl + index.toString(), Config.jwtToken);
                  response.then((value) {
                    if (value == null) {
                      print(buttonUrl + index.toString());
                    } else {
                      print("2");
                      _missionResponse = MissionResponse.fromJson(value);
                    }}).catchError((error) {
                    print('error : $error');
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          MissionContentPage(
                            missionResponse: _pageMissionResponse.missions![index],
                            status: 1,
                          )
                  )
                  );
                },
              );
            }));
  }
}
