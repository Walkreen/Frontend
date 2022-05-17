import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String name;
  final String text;
  final TextInputType keyboard;
  final TextEditingController controller;
  final VoidCallback? onEditingComplete;
  bool obscureText;
  bool focus;

  MyTextField({
    this.onEditingComplete,
    required this.name,
    required this.text,
    required this.keyboard,
    required this.controller,
    this.obscureText = false,
    this.focus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onEditingComplete: onEditingComplete,
      controller: controller,
      decoration: InputDecoration(
        labelText: name,
        labelStyle: const TextStyle(color: Colors.black),
        hintText: text,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(width: 1, color: Colors.redAccent),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
            width: 1.5,
            color: Color(0xFF339E66),
          ),
        ),
      ),
      keyboardType: keyboard,
      obscureText: obscureText,
      autofocus: focus,
    );
  }
}
