import 'package:flutter/material.dart';
import 'package:flutter_study_chatapp/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ChatApp",
      home: LoginSignupScreen(),
    );
  }
}
