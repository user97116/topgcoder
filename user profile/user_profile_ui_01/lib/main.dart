import 'package:flutter/material.dart';

import 'pages/page1/page1.dart';
import 'pages/page2/page2.dart';
import 'pages/page3/page3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Profile 01',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Page3(),
    );
  }
}
