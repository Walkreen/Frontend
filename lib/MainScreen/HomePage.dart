import 'package:capstone/data/Game_button.dart';
import 'package:flutter/material.dart';

import '../api/Config.dart';
import '../api/HttpController.dart';
import '../data/my_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int? prePoint = 0;

  final String url = Config.baseURL + '/api/item/getItem';

  HttpController _httpController = HttpController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var response = _httpController.httpGetWithAuth(url, Config.jwtToken);
    response.then((value) => {
      prePoint = Config.xp
    });
  }

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
                "홈",
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
                height: 80.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                        "${prePoint}",
                      style: TextStyle(
                          fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFBF00),
                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "P",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                ]
              ),
              SizedBox(
                height: 30.0,
              ),
              Image.asset(
                'images/Earth.png',
                width: 200,
                height: 200,
              ),

              SizedBox(
                height: 50.0,
              ),

              Container(
                width: 300,
                child: LinearProgressIndicator(
                  value: Config.xp! / 10000,
                ),
              ),

              SizedBox(
                height: 50.0,
              ),

              GameButton(
                buttonName: '게임 실행',
                onPressed: () {
                  Navigator.pushNamed(context, '/Game');
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
