import 'package:intern_demo/helper/constants.dart';
import 'package:intern_demo/homePageViews/following.dart';
import 'package:intern_demo/homePageViews/forYou.dart';
import 'dart:io';
import 'package:intern_demo/helper/helperfunctions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intern_demo/views/account.dart';
import 'package:intern_demo/views/add.dart';
import 'package:intern_demo/views/comments.dart';
import 'package:intern_demo/views/home.dart';
import 'package:intern_demo/views/search.dart';
import 'package:video_player/video_player.dart';
import 'package:intern_demo/helper/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = new PageController();
  VideoPlayerController playerController;

  int _selectedIndex = 0;

  List<Widget> pages = [Home(), Search(), AddVideo(), Comments(), Account()];

  getUserName() async {
    String name = await HelperFunctions.getUserNameSharedPreference();
    setState(() {
      Constants.userName = name;
    });
  }

  @override
  void initState() {
    getUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,

      body: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        children: pages,
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.black, primaryColor: Colors.black),
        child: BottomNavigationBar(
          fixedColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Container(width: 2, height: 2)),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.white),
                title: Container(width: 2, height: 2)),
            BottomNavigationBarItem(
                icon: addButton(), title: Container(width: 2, height: 2)),
            BottomNavigationBarItem(
                icon: Icon(Icons.comment, color: Colors.white),
                title: Container(width: 2, height: 2)),
            BottomNavigationBarItem(
                icon: Icon(Icons.face, color: Colors.white),
                title: Container(width: 2, height: 2)),
          ],
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
              pageController.animateToPage(_selectedIndex,
                  duration: Duration(milliseconds: 330), curve: Curves.linear);
            });
          },
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}
