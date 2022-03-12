import 'package:flutter/material.dart';

class ScreenC extends StatelessWidget {
  const ScreenC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ScreenC'),
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
                  Navigator.pushNamed(context, '/b');
                },
                color: Colors.red,
                child: Text('Go To ScreenB')),
          ],
        )));
  }
}
