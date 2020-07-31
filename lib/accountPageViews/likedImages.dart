import 'package:flutter/material.dart';
import 'package:intern_demo/helper/widgets.dart';

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
                child: accountThumnails(context, 0, "imgDemo.png"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: accountThumnails(context, 0, "imgDemo.png"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: accountThumnails(context, 0, "imgDemo.png"),
              ),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: accountThumnails(context, 0, "imgDemo.png"),
              ),
            ],
          ),
        ],
      )
    );
  }
}