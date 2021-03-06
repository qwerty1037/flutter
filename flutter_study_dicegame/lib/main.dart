import 'package:flutter/material.dart';
import 'dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 50)),
                  Center(
                    child: Image(
                      image: AssetImage('image/chef.gif'),
                      width: 170.0,
                      height: 190.0,
                    ),
                  ),
                  Form(
                    child: Theme(
                      data: ThemeData(
                        primaryColor: Colors.teal,
                        inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(
                            color: Colors.teal,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: controller1,
                              decoration:
                                  InputDecoration(labelText: 'Enter "Dice"'),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextField(
                              controller: controller2,
                              decoration:
                                  InputDecoration(labelText: 'Enter Password'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            ButtonTheme(
                              minWidth: 100,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orangeAccent,
                                ),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  if (controller1.text == 'dice' &&
                                      controller2.text == '1234') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Dice()),
                                    );
                                  } else if (controller1.text == 'dice' &&
                                      controller2.text != '1234') {
                                    showSnackBar2(context);
                                  } else if (controller1.text != 'dice' &&
                                      controller2.text == '1234') {
                                    showSnackBar3(context);
                                  } else {
                                    showSnackBar(context);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        '????????? ????????? ?????? ???????????????',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}

void showSnackBar2(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        '??????????????? ???????????? ????????????',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}

void showSnackBar3(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'dice??? ????????? ???????????????',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}
