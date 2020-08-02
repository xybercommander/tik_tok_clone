import 'package:flutter/material.dart';
import 'package:intern_demo/helper/widgets.dart';
import 'package:intern_demo/videoPages/itachipage.dart';
import 'package:intern_demo/videoPages/kakashipage.dart';
import 'package:intern_demo/videoPages/tanjiropage.dart';

class MyImages extends StatefulWidget {
  @override
  _MyImagesState createState() => _MyImagesState();
}

class _MyImagesState extends State<MyImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
          childAspectRatio: (MediaQuery.of(context).size.width / 3) / (MediaQuery.of(context).size.height / 4),
          crossAxisCount: 3,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              child: accountThumnails(context, 109, "imgDemo.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => KakashiPage()));
                  },
                  child: accountThumnails(context, 61, "kakashi.jpg")),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ItachiPage()));
                  },
                  child: accountThumnails(context, 61, "itachi.jpg")),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TanjiroPage()));
                  },
                  child: accountThumnails(context, 61, "kamado.jpg")),
            ),
      ],
    ));
  }
}
