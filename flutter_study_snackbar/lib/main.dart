import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack bar',
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack Bar'),
        centerTitle: true,
      ),
      body: Builder(
        builder: (BuildContext ctx) {
          return Center(
              // ignore: deprecated_member_use
              child: FlatButton(
            child: Text(
              'Show me',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.red,
            onPressed: () {
              Scaffold.of(ctx)
                  // ignore: deprecated_member_use
                  .showSnackBar(SnackBar(content: Text('Hellow')));
            },
          ));
        },
      ),
    );
  }
}
