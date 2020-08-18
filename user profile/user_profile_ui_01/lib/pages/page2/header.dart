import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
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
            color: Colors.black45,
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 32.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
