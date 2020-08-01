import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern_demo/SignPages/signIn.dart';
import 'package:intern_demo/helper/authenticate.dart';
import 'package:intern_demo/views/mainPage.dart';
import 'package:intern_demo/helper/helperfunctions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool userIsLoggedIn = false;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
        if(userIsLoggedIn == null) {
          userIsLoggedIn = false;
        }
        print(userIsLoggedIn);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        
      ),
      home: userIsLoggedIn ? MainPage() : Authenticate(),
    );
  }
}
