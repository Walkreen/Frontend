import 'package:flutter/material.dart';

class StartAblePage extends StatefulWidget {
  const StartAblePage({Key? key}) : super(key: key);

  @override
  State<StartAblePage> createState() => _StartAblePageState();
}

class _StartAblePageState extends State<StartAblePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Startable mission Page",
          style: TextStyle(
              fontSize: 20.0
          ),),
      ),
    );
  }
}
