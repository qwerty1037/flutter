import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Toastmessage",
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Toast Message"),
          centerTitle: true,
        ),
        body: Center(
          child: FlatButton(
            child: Text("toast"),
            color: Colors.blue,
            onPressed: () {
              flutterToast();
            },
          ),
        ));
  }
}

void flutterToast() {
  Fluttertoast.showToast(
    msg: 'Flutter',
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.redAccent,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}
