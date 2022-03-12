import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ScreenB'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                color: Colors.red,
                child: Text('Go To ScreenA')),
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
