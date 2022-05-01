import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {

  final String text;

  TitleText({
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
        fontSize: 23.5,
        fontWeight: FontWeight.bold,
        color: Color(0xFF036635)
      ),
    );
  }
}
