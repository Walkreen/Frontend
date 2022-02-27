import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  MyButton({required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF007F4A),
          minimumSize: Size(400, 45),
        ),
      ),
    );
  }
}
