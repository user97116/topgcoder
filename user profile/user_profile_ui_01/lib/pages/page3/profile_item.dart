import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 80.0,
          width: 80.0,
          child: Stack(
            children: <Widget>[
              Container(),
              CircleAvatar(
                maxRadius: 35.0,
                backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
              ),
              Align(
                alignment: Alignment(0.7, 0.5),
                child: CircleAvatar(
                  radius: 8.0,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.check,
                    size: 10.0,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        Spacer(),
        OutlineButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text("ADD FRIEND"),
          onPressed: () {},
        ),
        FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Color(0xfffe2359),
          child: Text(
            "FOLLOW",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
