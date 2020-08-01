import 'package:flutter/material.dart';
import 'package:intern_demo/helper/widgets.dart';
import 'package:intern_demo/videoPages/itachipage.dart';
import 'package:intern_demo/videoPages/kakashipage.dart';
import 'package:intern_demo/videoPages/minatopage.dart';
import 'package:intern_demo/videoPages/tanjiropage.dart';

class LikedImages extends StatefulWidget {
  @override
  _LikedImagesState createState() => _LikedImagesState();
}

class _LikedImagesState extends State<LikedImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ItachiPage()));
                    },
                    child: accountThumnails(context, 61, "itachi.jpg")),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TanjiroPage()));
                    },
                    child: accountThumnails(context, 61, "kamado.jpg")),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MinatoPage()));
                    },
                    child: accountThumnails(context, 61, "minato.jpg")),
              ),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => KakashiPage()));
                    },
                    child: accountThumnails(context, 61, "kakashi.jpg")),
              ),
            ],
          ),
        ],
      )
    );
  }
}