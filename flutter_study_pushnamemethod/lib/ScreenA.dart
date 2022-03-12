import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ScreenA'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/b');
                },
                color: Colors.red,
                child: Text('Go To ScreenB')),
            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/c');
                },
                color: Colors.red,
                child: Text('Go To ScreenC')),
          ],
        )));
  }
}
