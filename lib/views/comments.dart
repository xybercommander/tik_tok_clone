import 'package:flutter/material.dart';
import 'package:intern_demo/helper/widgets.dart';

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications", style: TextStyle(fontFamily: "Quicksand", color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text("Contacts", style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: "Quicksand"),)),
          )
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                commentTile("Followers", Icons.group, Colors.blue),
                commentTile("Like", Icons.favorite_border, Colors.redAccent),
                commentTile("@ me", Icons.blur_on, Colors.green),
                commentTile("Comment", Icons.comment, Colors.deepPurple),
              ],
            ),
          )
        ],
      ),
    );
  }
}