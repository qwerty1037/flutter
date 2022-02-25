import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First App",
      theme: ThemeData(
        primarySwatch: Colors.blue //기본 색상
      ),
      home: MyCard(), //App이 실행될 때 가장 먼저 진행되는 경로
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('220209_flutter study'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Hello'),
            Text('Hello'),
            Text('Hello'),
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BBANTO"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello'),
            Text('Hello'),
            Text('Hello'),
          ],
        ),
      ),

    );
  }
}
