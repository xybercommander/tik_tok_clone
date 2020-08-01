import 'package:flutter/material.dart';
import 'package:intern_demo/accountPageViews/likedImages.dart';
import 'package:intern_demo/accountPageViews/myImages.dart';
import 'package:intern_demo/helper/constants.dart';
import 'package:intern_demo/helper/helperfunctions.dart';
import 'package:intern_demo/services/auth.dart';
import 'package:intern_demo/helper/authenticate.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  PageController accountPageController = new PageController();
  int _accountPageIndex = 0;

  AuthMethods authMethods = new AuthMethods();

  getProfilePic() async {
    String imageurl = await HelperFunctions.getUserImageUrlPreference();
    setState(() {
      Constants.imageUrl = imageurl;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "@${Constants.userName}",
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
              GestureDetector(
                onTap: () {
                  authMethods.signOut();
                  HelperFunctions.saveUserLoggedInSharedPreference(false);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Authenticate()));
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    )),
              )
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
                  GestureDetector(
                    onTap: () {
                      print(Constants.profilePic.toString());
                    },
                    child: Container(
                        width: 80,
                        height: 80,
                        child: CircleAvatar(
                            backgroundImage: Constants.imageUrl == ""
                                ? AssetImage("assets/Profile1.png")
                                : NetworkImage("${Constants.imageUrl}"))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "@${Constants.userName}",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.image,
                          color: _accountPageIndex == 0
                              ? Colors.black
                              : Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                      Container(
                        height: 30,
                        width: 1,
                        color: Colors.grey,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: _accountPageIndex == 1
                              ? Colors.black
                              : Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: PageView(
                      controller: accountPageController,
                      onPageChanged: (value) {
                        setState(() {
                          _accountPageIndex = value;
                        });
                      },
                      children: [
                        MyImages(),
                        LikedImages(),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
