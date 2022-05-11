import 'package:flutter/material.dart';

class InProgressedPage extends StatefulWidget {
  const InProgressedPage({Key? key}) : super(key: key);

  @override
  State<InProgressedPage> createState() => _InProgressedPageState();
}

class _InProgressedPageState extends State<InProgressedPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("In Progressed Mission Page",
          style: TextStyle(
              fontSize: 20.0
          ),),
      ),
    );
  }
}
