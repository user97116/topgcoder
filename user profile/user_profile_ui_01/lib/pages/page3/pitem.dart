import 'package:flutter/material.dart';

class PItem extends StatelessWidget {
  final title;
  final subtitle;

  const PItem({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        ),
        SizedBox(height: 6.0),
        Text(
          subtitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}
