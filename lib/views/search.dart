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
        child: Stack(
          children: [            
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/searchBg2.jpg",), fit: BoxFit.cover)
                  ),
                ),
                trendingTag("welcome2020_india", "400k"),
                thumbnailList(context, "itachi.jpg", "kakashi.jpg", "minato.jpg", "kamado.jpg"),
                trendingTag("transitionbattle_in2", "220k"),
                thumbnailList(context, "kamado.jpg", "minato.jpg", "kakashi.jpg", "itachi.jpg"),
                trendingTag("facialexpression_battle", "127K"),
                thumbnailList(context, "kakashi.jpg", "itachi.jpg", "minato.jpg", "kamado.jpg"),
              ],
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 100,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Search People around the world",
                            labelStyle: TextStyle(fontSize: 15, color: Colors.white, fontFamily: "Quicksand"),
                            border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      height: 50,
                      width: 50,
                       decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Center(
                        child: Icon(Icons.group_add, color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}