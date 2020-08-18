import 'package:flutter/material.dart';

class FItem extends StatelessWidget {
  final title;
  final subtitle;

  const FItem({Key key, this.title, this.subtitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Colors.white30,
            fontSize: 12.0,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
