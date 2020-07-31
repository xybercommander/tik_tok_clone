import 'package:flutter/material.dart';
import 'package:intern_demo/helper/widgets.dart';

class MyImages extends StatefulWidget {
  @override
  _MyImagesState createState() => _MyImagesState();
}

class _MyImagesState extends State<MyImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: accountThumnails(context, 109, "imgDemo.png"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: accountThumnails(context, 61, "imgDemo.png"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: accountThumnails(context, 50, "imgDemo.png"),
              ),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: accountThumnails(context, 19, "imgDemo.png"),
              ),
            ],
          ),
        ],
      )
    );
  }
}
