import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Stories extends StatefulWidget {
  const Stories({Key key}) : super(key: key);

  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  var data = [
    "Ellipse 6.png",
    "Ellipse 7.png",
    "Ellipse 8.png",
    "Ellipse 9.png",
    "Ellipse 10.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(17, 22, 17, 22),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: CircleAvatar(
                  radius: 34,
                  backgroundColor: Colors.black87,
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('assets/images/Ellipse 6.png'),
                    ),
                  ),
                ),
              ),
              for (int i = 1; i < data.length; i++)
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Container(
                    child: Expanded(
                      child: CircleAvatar(
                        radius: 34,
                        backgroundColor: Colors.black87,
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/images/${data[i]}"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
