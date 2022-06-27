
import 'package:capstone/api/user/SignUpRequest.dart';
import 'package:flutter/material.dart';

class Config with ChangeNotifier {
  static String baseURL = "http://150.230.248.249:1998";

  static String? jwtToken = "";

  static SignUpRequest? signUpRequest = SignUpRequest();

  static int? xp = 0;

  static String? email = "";

  static String? name = "";

  static String? nickname = "";

  static String? gender = "";

  static String? birthday = "";
}