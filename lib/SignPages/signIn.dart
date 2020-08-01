import 'package:intern_demo/helper/constants.dart';
import 'package:intern_demo/helper/helperfunctions.dart';
import 'package:intern_demo/services/auth.dart';
import 'package:intern_demo/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intern_demo/helper/widgets.dart';
import 'package:intern_demo/views/mainPage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn(this.toggle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods dataBaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();

  bool isLoading = false;
  bool showPassword = false;
  QuerySnapshot snapShotUserInfo;

  // Sing in method
  signIn() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      HelperFunctions.saveUserEmailSharedPreference(
          emailTextEditingController.text);

      dataBaseMethods
          .getUserByEmail(emailTextEditingController.text)
          .then((value) {
        snapShotUserInfo = value;
        String imageUrl = snapShotUserInfo.documents[0].data["imageUrl"];
        setState(() {
          Constants.imageUrl = imageUrl;
        });
        HelperFunctions.saveUserNameSharedPreference(
            snapShotUserInfo.documents[0].data["name"]);
        HelperFunctions.saveUserImageUrl(
            snapShotUserInfo.documents[0].data["imageUrl"]);
      });
      

      authMethods
          .signInWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((value) {
        if (value != null) {
          HelperFunctions.saveUserLoggedInSharedPreference(true);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainPage()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign In",
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
                          children: [
                            TextLiquidFill(
                              text: 'TIK-TOK CLONE',
                              waveColor: Colors.blueAccent,
                              boxBackgroundColor: Colors.white,
                              textStyle: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                              boxHeight: 100.0,
                              loadDuration: Duration(seconds: 5),
                            ),
                            SizedBox(
                              height: 50,
                            ),
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
                                obscureText:
                                    showPassword == true ? false : true,
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                color: Colors.grey[400],
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
                          Container(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                          ),
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
                          signIn();
                        },
                        // color: Colors.blue,
                        child: Text(
                          "Sign In",
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
                          Text("Don't have an account? ",
                              style: mediumStyle(Colors.black87)),
                          GestureDetector(
                            onTap: () {
                              widget.toggle();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text("Register Now",
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
