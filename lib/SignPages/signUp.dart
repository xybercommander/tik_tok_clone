import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
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
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  final Function toggle;
  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  bool showPassword = false;

  FirebaseStorage storage;

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
  signMeUp() async {
    // method call for sending data to the firestore database

    if (formKey.currentState.validate()) {
      final file = _profile;
      final StorageTaskSnapshot snapshot = await FirebaseStorage()
          .ref()
          .child("images/${userNameTextEditingController.text}")
          .putFile(file)
          .onComplete;
      final String downloadURL = await snapshot.ref.getDownloadURL();

      Map<String, dynamic> userInfoMap = {
        "name": userNameTextEditingController.text,
        "email": emailTextEditingController.text,
        "imageUrl": downloadURL
      };

      HelperFunctions.saveUserEmailSharedPreference(
          emailTextEditingController.text);
      HelperFunctions.saveUserNameSharedPreference(
          userNameTextEditingController.text);
      Constants.userName = userNameTextEditingController.text;
      Constants.profilePic = file;
      Constants.imageUrl = downloadURL;
      HelperFunctions.saveUserImageUrl(downloadURL);

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

  File _profile;

  Future<void> _getImage() async {
    final profile = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxWidth: 100, maxHeight: 100);
    setState(() {
      _profile = profile;
      Constants.profilePic = _profile;
    });
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
                color: Colors.white,
                height: MediaQuery.of(context).size.height - 100,
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Center(
                                      child: _profile == null
                                          ? Image.asset("assets/Profile1.png")
                                          : Container(
                                              // child: CircleAvatar(child: Image.file(_profile),),
                                              child: CircleAvatar(
                                                backgroundImage:
                                                    FileImage(_profile),
                                              ),
                                              height: 100,
                                              width: 100,
                                            )),
                                ),
                                FlatButton.icon(
                                    splashColor: Colors.blue,
                                    onPressed: _getImage,
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.blueGrey,
                                    ),
                                    label: Text(
                                      "Add your Profile pic",
                                      style: TextStyle(color: Colors.blueGrey),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
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
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.blue,
                        height: 50,
                        onPressed: () {
                          signMeUp();
                        },
                        // color: Colors.blue,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Quicksand",
                              fontSize: 20),
                        ),
                      ),
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
