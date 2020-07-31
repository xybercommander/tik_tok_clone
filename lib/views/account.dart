import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Samrat Mukherjee", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: Icon(Icons.person_add, color: Colors.black,),
        actions: [
          Row(
            children: [
              IconButton(icon: Icon(Icons.grid_on, color: Colors.black,), onPressed: null),
              IconButton(icon: Icon(Icons.more_horiz, color: Colors.black,), onPressed: null)
            ],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                CircleAvatar(backgroundImage: AssetImage("assets/profilepic.jpg"),)
              ],
            ),
          )
        ],
      ),
    );
  }
}