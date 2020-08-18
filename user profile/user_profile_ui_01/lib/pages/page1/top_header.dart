import 'package:flutter/material.dart';

import 'fitem.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://picsum.photos/200"),
          fit: BoxFit.cover,
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.4,
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.black38,
          ),
          SafeArea(
            child: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          Align(
            alignment: Alignment(0, -0.7),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: 50.0,
                    backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Neecoder X",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "@neecoder_pro",
                    style: TextStyle(
                      color: Colors.white30,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black45,
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FItem(
                    subtitle: "2332",
                    title: "FRIENDS",
                  ),
                  FItem(
                    subtitle: "2332",
                    title: "FOLLOWING",
                  ),
                  FItem(
                    subtitle: "2332",
                    title: "FOLLOWERS",
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
