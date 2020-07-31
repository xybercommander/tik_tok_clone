import 'package:flutter/material.dart';
import 'package:intern_demo/helper/widgets.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/searchBg.jpg",), fit: BoxFit.cover)
              ),
            ),
            trendingTag("welcome2020_india", "400k"),
            thumbnailList(context, "itachi.jpg", "kakashi.jpg", "minato.jpg", "tanjiro.jpg")
          ],
        ),
      ),
    );
  }
}