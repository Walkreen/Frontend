import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>{
  static final GlobalKey<ScaffoldState> _scaffoldKey =
  GlobalKey<ScaffoldState>();
  late UnityWidgetController _unityWidgetController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        body: UnityWidget(
          onUnityCreated: onUnityCreated,
          fullscreen: false,
        ),
      ),
    );
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    this._unityWidgetController = controller;
    setJWTToken('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ1aWQiOjcsInN1YiI6IndhbGtyZWVuSnd0IiwiYXRoIjpudWxsLCJlbWwiOiJqdW45NzExMDNAbmF2ZXIuY29tIiwiZXhwIjoxNjU1NjUwODU0LCJpYXQiOjE2NTU2NDkwNTR9.LQ7RaDzzR5BQuRTQoUe0gM_kEqeJpKMNEYh6cHXk9FcAtthB7vlGX9w2nzHOqLybceaD4c9q9gU9F7gBQ0o-Tg');
  }

  void setJWTToken(String token) {
    _unityWidgetController.postMessage('Canvas/GetToken', 'StoreToken', token);
  }
}
