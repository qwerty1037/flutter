import 'package:flutter/material.dart';
import 'package:flutter_study_chatapp/config/palette.dart';
import 'package:flutter_study_chatapp/screens/main_screen_widgets.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  final _formKey = GlobalKey<FormState>();

  String userName = '';
  String userEmail = '';
  String userPassword = '';

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('image/red.jpeg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 90, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Welcome',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  isSignupScreen ? ' to Yummy chat!' : ' back',
                              style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        isSignupScreen
                            ? 'Signup to continue'
                            : 'Signin to continue',
                        style: TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //배경
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: 180.0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                padding: EdgeInsets.all(20),
                height: isSignupScreen ? 280.0 : 250.0,
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (isSignupScreen)
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                buildLoginArgument(
                                  key: 1,
                                  prefixIcon: Icons.account_circle,
                                  text: 'User name',
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 4) {
                                      return 'Please enter at least 4 characters';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userName = value;
                                  },
                                ),
                                SizedBox(height: 8),
                                buildLoginArgument(
                                  key: 2,
                                  prefixIcon: Icons.email,
                                  text: 'e-mail',
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !value.contains('@')) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userEmail = value;
                                  },
                                ),
                                SizedBox(height: 8),
                                buildLoginArgument(
                                  key: 3,
                                  prefixIcon: Icons.lock,
                                  text: 'password',
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return 'password must be at least 7 characters';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userPassword = value;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (!isSignupScreen)
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                buildLoginArgument(
                                  key: 4,
                                  prefixIcon: Icons.email,
                                  text: 'e-mail',
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !value.contains('@')) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userEmail = value;
                                  },
                                ),
                                SizedBox(height: 8),
                                buildLoginArgument(
                                  key: 5,
                                  prefixIcon: Icons.lock,
                                  text: 'password',
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return 'password must be at least 7 characters';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userPassword = value;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            //Text Form Field
            Positioned(
              left: 20,
              top: 190,
              width: MediaQuery.of(context).size.width - 40,
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSignupScreen = false;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: !isSignupScreen
                                  ? Palette.activeColor
                                  : Palette.textColor1,
                            ),
                          ),
                          if (!isSignupScreen)
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              height: 2,
                              width: 55,
                              color: Colors.orange,
                            ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSignupScreen = true;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            'SIGNUP',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isSignupScreen
                                  ? Palette.activeColor
                                  : Palette.textColor1,
                            ),
                          ),
                          if (isSignupScreen)
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              height: 2,
                              width: 55,
                              color: Colors.orange,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //login&signup
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: isSignupScreen ? 430 : 400,
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      _tryValidation();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.orange,
                            Colors.red,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //전송 버튼
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: isSignupScreen
                  ? MediaQuery.of(context).size.height - 125
                  : MediaQuery.of(context).size.height - 165,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text(isSignupScreen ? 'or Signup with' : 'or Signin with'),
                  SizedBox(height: 10),
                  TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(155, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Palette.googleColor,
                    ),
                    icon: Icon(Icons.add),
                    label: Text('Google'),
                  ),
                ],
              ),
            ),
            //signup
          ],
        ),
      ),
    );
  }
}
