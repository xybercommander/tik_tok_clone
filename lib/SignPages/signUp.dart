import 'package:intern_demo/helper/constants.dart';
import 'package:intern_demo/helper/helperfunctions.dart';
import 'package:intern_demo/services/database.dart';
import 'package:flutter/material.dart';
import 'package:intern_demo/helper/widgets.dart';
import 'package:intern_demo/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intern_demo/views/mainPage.dart';
import 'dart:io';

class SignUp extends StatefulWidget {
  final Function toggle;
  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  bool showPassword = false;
  File _profilePic;

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController =
      new TextEditingController();
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();



  // Sign up Method
  signMeUp() {
    // method call for sending data to the firestore database

    if (formKey.currentState.validate()) {
      Map<String, dynamic> userInfoMap = {
        "name": userNameTextEditingController.text,
        "email": emailTextEditingController.text,
      };
      HelperFunctions.saveUserEmailSharedPreference(
          emailTextEditingController.text);
      HelperFunctions.saveUserNameSharedPreference(
          userNameTextEditingController.text);
      Constants.userName = userNameTextEditingController.text;

      authMethods
          .signUpWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((value) {
        // print("${value.userId}");

        databaseMethods.uploadUserInfo(userInfoMap);
        HelperFunctions.saveUserLoggedInSharedPreference(true);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      });

      setState(() {
        isLoading = true;
      });
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 100,
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                                validator: (username) {
                                  return username.isEmpty || username.length < 4
                                      ? "Please provide a valid Username"
                                      : null;
                                },
                                controller: userNameTextEditingController,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: "Quicksand"),
                                decoration:
                                    textFieldInputDecoration("username")),
                            TextFormField(
                                validator: (email) {
                                  return RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(email)
                                      ? null
                                      : "Please provide a valid email id";
                                },
                                controller: emailTextEditingController,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: "Quicksand"),
                                decoration: textFieldInputDecoration("email")),
                            TextFormField(
                                obscureText: showPassword ? false : true,
                                validator: (password) {
                                  return password.length > 6
                                      ? null
                                      : "Please provide a password which has more than 6 characters";
                                },
                                controller: passwordTextEditingController,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: "Quicksand"),
                                decoration:
                                    textFieldInputDecoration("password")),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              child: Container(
                                color: Colors.grey[400],
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: showPassword
                                    ? Text(
                                        "Hide password",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.white),
                                      )
                                    : Text(
                                        "Show password",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.white),
                                      ),
                              ),
                            ),
                          ),
                          Spacer()
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          signMeUp();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xff007EF4),
                                Color(0xff2A75BC)
                              ]),
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            "Sign Up",
                            style: mediumStyle(Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.redAccent]),
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            "Sign Up with Google",
                            style: mediumStyle(Colors.white),
                          )),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Already? have an account? ",
                              style: mediumStyle(Colors.black87)),
                          GestureDetector(
                            onTap: () {
                              widget.toggle();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text("Sign In now",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 17,
                                      decoration: TextDecoration.underline)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
