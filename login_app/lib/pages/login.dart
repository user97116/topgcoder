import 'package:flutter/material.dart';

import 'background/bg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BG(),
          Align(
            alignment: Alignment(0, 0),
            child: Container(
              color: Color(0xff404040),
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 30.0),
                      Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    width: 160.0,
                    color: Colors.white30,
                    height: 2.0,
                    child: Align(
                      alignment: Alignment(-1, 0),
                      child: Container(
                        width: 60.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 28.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      labelStyle: TextStyle(color: Color(0xfff9526c)),
                      labelText: "User Name",
                      fillColor: Color(0xff373737),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 14.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      labelStyle: TextStyle(color: Color(0xfff9526c)),
                      labelText: "Password",
                      fillColor: Color(0xff373737),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 14.0),
                  Align(
                    alignment: Alignment(1, 0),
                    child: Text(
                      "Forget password?",
                      style: TextStyle(
                        color: Color(0xfff9526c),
                      ),
                    ),
                  ),
                  SizedBox(height: 18.0),
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color(0xfff9526c),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pinkAccent,
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                    child: Align(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 14.0),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      "Don't have an acount? Create",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
