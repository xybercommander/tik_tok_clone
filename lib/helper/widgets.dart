import 'package:flutter/material.dart';

// This is the thumbnails present in the account page
Widget accountThumnails(context, int likes, String pic) {
  return Container(
    height: 200,
    width: MediaQuery.of(context).size.width / 3 - 15,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(
            image: AssetImage("assets/$pic"), fit: BoxFit.cover)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            children: [
              Icon(
                Icons.play_circle_outline,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "$likes",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        )
      ],
    ),
  );
}

//this is for the trending hashtags in search
Widget trendingTag(String hashtag, String likes) {
  return Container(
    width: double.infinity,
    height: 60,
    color: Colors.black87,
    padding: EdgeInsets.all(16),
    child: Row(
      children: [
        Container(
          height: 40,
          width: 30,
          decoration: BoxDecoration(
              color: Colors.grey[800], borderRadius: BorderRadius.circular(40)),
          child: Center(
            child: Text(
              "#",
              style: TextStyle(
                  fontFamily: "Quicksand", fontSize: 20, color: Colors.yellow),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$hashtag",
              style: TextStyle(
                  color: Colors.white, fontSize: 12, fontFamily: "Quicksand"),
            ),
            Text(
              "Trending Hashtag",
              style: TextStyle(color: Colors.grey[600], fontSize: 10),
            )
          ],
        ),
        Spacer(),
        Container(
          height: 30,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(40)),
          child: Center(
            child: Text(
              "$likes",
              style: TextStyle(
                  fontFamily: "Quicksand", fontSize: 13, color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}

// this is for the list in the search page
Widget thumbnailList(
    context,
    String pic1,
    String pic2,
    String pic3,
    String pic4,
    Widget widget1,
    Widget widget2,
    Widget widget3,
    Widget widget4) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 170,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => widget1));
          },
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 3 - 15,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/$pic1"), fit: BoxFit.cover),
                border: Border.all(color: Colors.black, width: 1)),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => widget2));
          },
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 3 - 15,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/$pic2"), fit: BoxFit.cover),
                border: Border.all(color: Colors.black, width: 1)),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => widget3));
          },
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 3 - 15,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/$pic3"), fit: BoxFit.cover),
                border: Border.all(color: Colors.black, width: 1)),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => widget4));
          },
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 3 - 15,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/$pic4"), fit: BoxFit.cover),
                border: Border.all(color: Colors.black, width: 1)),
          ),
        ),
      ],
    ),
  );
}

// this is for the tiles in comments page
Widget commentTile(String label, IconData icon, Color color) {
  return Column(
    children: [
      Container(
        height: 50,
        width: 50,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(3)),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "$label",
        style: TextStyle(fontFamily: "Quicksand"),
      )
    ],
  );
}

// this is for the add button in bottom navigation bar
Widget addButton() {
  return Container(
    width: 45,
    height: 27,
    child: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          width: 38,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 45, 108),
              borderRadius: BorderRadius.circular(7)),
        ),
        Container(
          margin: EdgeInsets.only(right: 10),
          width: 38,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 32, 211, 234),
              borderRadius: BorderRadius.circular(7)),
        ),
        Center(
          child: Container(
            height: double.infinity,
            width: 38,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: 20,
            ),
          ),
        )
      ],
    ),
  );
}

textFieldInputDecoration(String hintText) {
  return InputDecoration(
      labelText: "$hintText",
      labelStyle: TextStyle(
          fontSize: 15, color: Colors.blueAccent, fontFamily: "Quicksand"),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)));
}

/* Text Field style (Color only) */

TextStyle simpleStyle() {
  return TextStyle(
    color: Colors.white,
  );
}

/* Medium Text Styler */
TextStyle mediumStyle(Color customColor) {
  return TextStyle(color: customColor, fontSize: 17);
}

// this is for the share button in video page
Widget listInShare(context) {
  return Container(
    height: 100,
    width: MediaQuery.of(context).size.width,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Container(
              height: 50,
              width: 100,
              child: Center(
                child: Image.asset("assets/facebook.png"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Facebook",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            )
          ],
        ),
        Column(
          children: [
            Container(
              height: 50,
              width: 100,
              child: Center(
                child: Image.asset("assets/insta.png"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Instagram",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            )
          ],
        ),
        Column(
          children: [
            Container(
              height: 50,
              width: 100,
              child: Center(
                child: Image.asset("assets/fbmessenger.png"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Messenger",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            )
          ],
        ),
        Column(
          children: [
            Container(
              height: 50,
              width: 100,
              child: Center(
                child: Image.asset("assets/whatsapp.png"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Whatsapp",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            )
          ],
        ),
        Column(
          children: [
            Container(
              height: 50,
              width: 100,
              child: Center(
                child: Image.asset("assets/msg.png"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Message",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            )
          ],
        ),
        Column(
          children: [
            Container(
              height: 50,
              width: 100,
              child: Center(
                child: Image.asset("assets/twitter.png"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Tweet",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            )
          ],
        ),
        SizedBox(
          width: 10,
        ),
      ],
    ),
  );
}

// this is for the comments
Widget commentBox(context, String username, String comment, String likes) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    width: MediaQuery.of(context).size.width,
    height: 100,
    child: Row(
      children: [
        Image.asset("assets/Profile1.png", height: 50, width: 50,),
        SizedBox(width: 10,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(username, style: TextStyle(fontFamily: "Quicksand", fontSize: 12, color: Colors.grey),),
            SizedBox(height: 5,),
            Text(comment, style: TextStyle(fontFamily: "Quicksand"),)
          ],
        ),
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, color: Colors.grey,),
            SizedBox(height: 5,),
            Text(likes, style: TextStyle(fontFamily: "Quicksand", fontSize: 12, color: Colors.grey),),
          ],
        )
      ],
    ),
  );
}
