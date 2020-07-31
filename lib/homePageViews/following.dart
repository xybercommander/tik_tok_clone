import 'package:flutter/material.dart';
import 'package:intern_demo/videoPages/page1.dart';
import 'package:intern_demo/videoPages/page2.dart';
import 'package:intern_demo/videoPages/page3.dart';

class Following extends StatefulWidget {
  @override
  _FollowingState createState() => _FollowingState();
}

class _FollowingState extends State<Following> {

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