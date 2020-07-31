import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddVideo extends StatefulWidget {
  @override
  _AddVideoState createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {

  File _video;

  Future<void> _takeVideo() async {
    final videofile = await ImagePicker.pickVideo(
        source: ImageSource.camera, maxDuration: Duration(seconds: 10));
    setState(() {
      _video = videofile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/happyPeople.jpg"))
            ),
          )
        ],
      ),
    );
  }
}