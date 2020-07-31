import 'package:flutter/material.dart';
import 'package:intern_demo/homePageViews/following.dart';
import 'package:intern_demo/homePageViews/forYou.dart';
import 'package:intern_demo/views/account.dart';
import 'package:intern_demo/views/add.dart';
import 'package:intern_demo/views/comments.dart';
import 'package:intern_demo/views/home.dart';
import 'package:intern_demo/views/search.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = new PageController();
  VideoPlayerController playerController;

  int _selectedIndex = 0;

  List<Widget> pages = [Home(), Search(), AddVideo(), Comments(), Account()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
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


      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black87,), title: Container(width: 2, height: 2)),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.black87), title: Container(width: 2, height: 2)),
          BottomNavigationBarItem(
              icon: Icon(Icons.add, color: Colors.black87), title: Container(width: 2, height: 2)),
          BottomNavigationBarItem(
              icon: Icon(Icons.comment, color: Colors.black87), title: Container(width: 2, height: 2)),
          BottomNavigationBarItem(
              icon: Icon(Icons.face, color: Colors.black87), title: Container(width: 2, height: 2)),
        ],
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
            pageController.animateToPage(_selectedIndex, duration: Duration(milliseconds: 330), curve: Curves.linear);
          });
        },
        currentIndex: _selectedIndex,        
      ),
    );
  }
}
