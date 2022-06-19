import 'package:flutter/material.dart';

class CompletedPage extends StatefulWidget {
  const CompletedPage({Key? key}) : super(key: key);

  @override
  State<CompletedPage> createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletedPage> {
  @override
  final List<String> title = <String>[
    "홍덕이 바보",
    "태규 바보",
    "찬호 바보",
  ];

  final List<int> reward = <int>[10, 20, 30, 40, 50];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 30),
            itemCount: title.length,
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
                            width: 40.0,
                          ),
                          Container(
                            width: 220,
                            child: Text("${title[index]}"),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            width: 50,
                            child: Text("${reward[index]}"),
                          ),
                        ],
                      )),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/SecondJoin');
                },
              );
            }));
  }
}
