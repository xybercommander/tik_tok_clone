import 'package:flutter/material.dart';
import 'package:intern_demo/homePageViews/forYou.dart';
import 'package:intern_demo/homePageViews/following.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _homePageIndex = 1;
  List<Widget> homePages = [Following(), ForYou()];

  PageController homePageController = new PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _homePageIndex = 0;
                    homePageController.animateToPage(_homePageIndex, duration: Duration(milliseconds: 100), curve: Curves.linear);
                  });
                },
                child: Text(
                  "Following",
                  style: TextStyle(
                      fontSize: _homePageIndex == 0 ? 22 : 17,
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.w400),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _homePageIndex = 1;
                    homePageController.animateToPage(_homePageIndex, duration: Duration(milliseconds: 100), curve: Curves.linear);
                  });
                },
                child: Text(
                  "For You",
                  style: TextStyle(
                      fontSize: _homePageIndex == 1 ? 22 : 17,
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.black.withOpacity(0.0),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.black38),
          child: PageView(
            controller: homePageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) {
              setState(() {
                _homePageIndex = value;
              });
            },
            children: homePages,
          ),
        ));
  }
}
