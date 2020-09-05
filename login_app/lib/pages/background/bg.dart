import 'package:flutter/material.dart';

class BG extends StatelessWidget {
  const BG({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff3d3d3d),
      child: Stack(
        children: [
          Container(),
          Align(
            alignment: Alignment(1.3, -1.3),
            child: Container(
              width: 170.0,
              height: 170.0,
              decoration: BoxDecoration(
                color: Color(0xfff8506a),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-1.4, -1.4),
            child: Container(
              width: 250.0,
              height: 250.0,
              decoration: BoxDecoration(
                color: Color(0xffff637b),
                shape: BoxShape.circle,
              ),
              child: Stack(
                children: [
                  Container(),
                  Align(
                    alignment: Alignment(0, 0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: Color(0xfff84e69),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 18.0),
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Color(0xfff84e69),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.6, 1),
            child: Container(
              width: 80.0,
              height: 100.0,
              child: Stack(
                children: [
                  Container(),
                  Align(
                    alignment: Alignment(0, -4.3),
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: Color(0xffff637b),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Container(
                      width: 80.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xffff637b),
                      ),
                      child: Stack(
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment(0, -0.7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 10.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xfff84e69),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Container(
                                  width: 20.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xfff84e69),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
