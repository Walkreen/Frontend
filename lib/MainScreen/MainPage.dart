import 'dart:io';

import 'package:capstone/MainScreen/HomePage.dart';
import 'package:capstone/MainScreen/Mission/MissionPage.dart';
import 'package:capstone/auto/UserPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersive
    );
    SystemChrome.setSystemUIChangeCallback(
            (systemOverlaysAreVisible) {
              sleep(Duration(seconds:2));
              return SystemChrome.setEnabledSystemUIMode(
                  SystemUiMode.immersive
              );
            },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: const TabBarView(
            children: [
              MissionPage(),
              HomePage(),
              UserPage(),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(
                    color: Colors.green,
                    spreadRadius: 1,
                    blurRadius: 1
                )]
            ),
            child: const TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.green,
                indicatorWeight: 4,
                labelColor: Color(0xFF9EEFAF),
                unselectedLabelColor: Color(0xFF007F4A),
                labelStyle: TextStyle(
                  fontSize: 17,),

                tabs: [
                  Tab(
                    icon: Icon(Icons.wb_incandescent),
                    text: '미션',
                  ),
                  Tab(
                    icon: Icon(Icons.home),
                    text: '홈',
                  ),
                  Tab(
                    icon: Icon(Icons.people_alt),
                    text: '내정보',
                  )
                ]),
          ),
        )),
        onWillPop: () {
          return Future(() => false);
        });
  }
}
