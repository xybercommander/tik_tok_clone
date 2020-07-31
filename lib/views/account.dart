import 'package:flutter/material.dart';
import 'package:intern_demo/accountPageViews/likedImages.dart';
import 'package:intern_demo/accountPageViews/myImages.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  PageController accountPageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Samrat Mukherjee",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.person_add,
          color: Colors.black,
        ),
        actions: [
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.grid_on,
                    color: Colors.black,
                  ),
                  onPressed: null),
              IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                  ),
                  onPressed: null)
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: [
                  Container(
                      width: 80,
                      height: 80,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/profilepic.jpg"),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "@xybercommander",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[200]),
                    child: Center(
                        child: Text(
                      "3 videos",
                      style: TextStyle(color: Colors.grey[700]),
                    )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "30",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Following")
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "2",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Fans")
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "6",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Hearts")
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.pink),
                        child: Center(
                          child: Text(
                            "Edit profile",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white),
                        child: Center(
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white),
                        child: Center(
                          child: Icon(
                            Icons.bookmark_border,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Programmer, Gamer, Flutter Developer. Stay Hungry, Stay Foolish",
                      style: TextStyle(color: Colors.grey[700]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.image,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 1,
                        color: Colors.grey,
                      ),
                      IconButton(
                        icon: Image.asset(
                          "assets/heart.jpg",
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: PageView(
                      controller: accountPageController,
                      children: [
                        MyImages(),
                        LikedImages(),                        
                      ],
                    ),
                  )
                  // Container(
                  //   width: double.infinity,
                  //   height: 100,
                  //   color: Colors.green,
                  // ),
                  // SizedBox(height: 10,),
                  // Container(
                  //   width: double.infinity,
                  //   height: 100,
                  //   color: Colors.green,
                  // ),
                  // SizedBox(height: 10,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
