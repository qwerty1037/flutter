import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appbar',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Appbar icon menu'),
          centerTitle: true,
          elevation: 0.0,
          // leading: IconButton(  //appbar title 왼쪽에
          //   icon: Icon(Icons.menu),
          //   onPressed: () {
          //       print('menu button is clicked');
          //   },
          // ),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                print('Shopping cart button is clicked');
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('Search button is clicked');
              },
            ),
          ],
        ),
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/Screenshot_1645282053.png'),
              backgroundColor: Colors.white,
            ),
            otherAccountsPictures: [
              CircleAvatar(),
            ],
            accountName: Text("BBanto"),
            accountEmail: Text("bbanto@bbanto.com"),
            onDetailsPressed: () {
              print("arrow is clicked");
            },
            decoration: BoxDecoration(
              color: Colors.red[200],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          )
        ])));
  }
}
