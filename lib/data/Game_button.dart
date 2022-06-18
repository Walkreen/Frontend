import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback? onPressed;

  GameButton({required this.buttonName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(

          buttonName,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
            primary: Color(0xFF007F4A),
            minimumSize: Size(350, 55),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)
            )
        ),
      ),
    );
  }
}
