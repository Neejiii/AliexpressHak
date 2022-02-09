import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/theme.dart';

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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10, top: 10, left: 10),
            child: CircleAvatar(
              radius: 32,
              backgroundColor: CColors.dark_grey,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: CColors.white,
                backgroundImage: AssetImage("assets/images/${data[1]}"),
                child: const ClipRRect(
                  child:
                      Icon(Icons.add_rounded, size: 40, color: CColors.white),
                ),
              ),
            ),
          ),
          for (int i = 1; i < data.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 10),
              child: CircleAvatar(
                radius: 34,
                backgroundColor: Colors.black87,
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/${data[i]}"),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
