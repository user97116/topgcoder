import 'package:flutter/material.dart';

class PItem extends StatelessWidget {
  const PItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
        ),
        SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Neecoder X",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Neecoder X",
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black38,
              ),
            ),
          ],
        ),
        Spacer(),
        FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Color(0xfff92a57),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.all(0.0),
          onPressed: () {},
          child: Text(
            "Follow",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
