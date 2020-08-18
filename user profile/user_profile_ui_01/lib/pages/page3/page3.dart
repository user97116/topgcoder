import 'package:flutter/material.dart';
import 'package:user_profile_ui_01/pages/page3/pitem.dart';

import 'profile_item.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://picsum.photos/600"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(),
            Align(
              alignment: Alignment(-1, -1),
              child: SafeArea(
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    height: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ProfileItem(),
                        Text(
                          "Neecoder X",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21.0,
                          ),
                        ),
                        Text(
                          "@neecoder_pro",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black38,
                          ),
                        ),
                        SizedBox(height: 18.0),
                        Text(
                          "Ea incididunt anim adipisicing sunt exercitation Lorem labore aute Lorem occaecat.",
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(height: 24.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            PItem(
                              title: "FRIENDS",
                              subtitle: "2323",
                            ),
                            PItem(
                              title: "FOLLOWERS",
                              subtitle: "2323",
                            ),
                            PItem(
                              title: "FOLLOWING",
                              subtitle: "2323",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
