import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
              image: DecorationImage(image: AssetImage("assets/bgImg3.jpeg"), fit: BoxFit.cover)
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 100,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(width: 20.0, height: 100.0),
                  Text(
                    "Start",
                    style: TextStyle(fontSize: 23.0, color: Colors.white),
                  ),
                  SizedBox(width: 20.0, height: 100.0),
                  RotateAnimatedTextKit(
                    duration: Duration(seconds: 5),                    
                    text: ["Taking Awesome Videos", "gaining followers", "sharing your love to world"],
                    textStyle: TextStyle(fontSize: 20.0, fontFamily: "Quicksand", color: Colors.white),
                    textAlign: TextAlign.start,
                    // alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
                ],
              )
            ),
          )
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: Icon(Icons.video_call),
        onPressed: _takeVideo,

      ),
    );
  }
}