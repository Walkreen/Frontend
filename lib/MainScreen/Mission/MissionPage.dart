import 'package:capstone/MainScreen/Mission/CompletedPage.dart';
import 'package:capstone/MainScreen/Mission/InProgressPage.dart';
import 'package:capstone/MainScreen/Mission/StartAblePage.dart';
import 'package:flutter/material.dart';

class MissionPage extends StatefulWidget {
  const MissionPage({Key? key}) : super(key: key);

  @override
  State<MissionPage> createState() => _MissionPageState();
}

class _MissionPageState extends State<MissionPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.web))
            ],
            backgroundColor: Color(0xFF007F4A),
            automaticallyImplyLeading: false,
            title:  const Center(child: Text("\t\t\t\t\t\t  미션",
            style: TextStyle(
              fontSize: 22.0
            ),)),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              tabs: [
                Container(
                  height: 35.0,
                  child: Text("시작 가능",
                  style: TextStyle(
                    fontSize: 18.0
                  ),),
                ),
                Container(
                  height: 35.0,
                  child: Text("진행중",
                    style: TextStyle(
                        fontSize: 18.0
                    ),),
                ),
                Container(
                  height: 35.0,
                  child: Text("완료",
                    style: TextStyle(
                        fontSize: 18.0
                    ),),

                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            StartAblePage(),
            InProgressedPage(),
            CompletedPage()
          ],
        )
      ),
    );
  }
}
