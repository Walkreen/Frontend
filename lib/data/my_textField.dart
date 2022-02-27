import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String name;
  final String text;
  final TextInputType keyboard;
  final TextEditingController controller;
  bool obscureText;

  MyTextField(
      {required this.name,
        required this.text,
        required this.keyboard,
        required this.controller,
        this.obscureText= false,
      });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: name,
        labelStyle: TextStyle(color: Colors.black),
        hintText: text,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(width: 1, color: Colors.redAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
            width: 1.5,
            color: Color(0xFF339E66),
          ),
        ),
      ),
      keyboardType: keyboard,
      obscureText: obscureText,
    );
  }
}
