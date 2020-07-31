import 'package:flutter/material.dart';
import 'package:intern_demo/videoPages/page1.dart';
import 'package:intern_demo/videoPages/page2.dart';
import 'package:intern_demo/videoPages/page3.dart';

class ForYou extends StatefulWidget {
  @override
  _ForYouState createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {
  List<Widget> videos = [VideoPage1(), VideoPage2(), VideoPage3()];
  PageController videoPageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          child: PageView(
            scrollDirection: Axis.vertical,
            controller: videoPageController,
            children: videos,
          )),
    );
  }
}
