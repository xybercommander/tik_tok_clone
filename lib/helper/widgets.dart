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
        Row(
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
    context, String pic1, String pic2, String pic3, String pic4) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 170,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 3 - 15,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/$pic1"), fit: BoxFit.cover),
              border: Border.all(color: Colors.black, width: 1)),
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width / 3 - 15,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/$pic2"), fit: BoxFit.cover),
              border: Border.all(color: Colors.black, width: 1)),
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width / 3 - 15,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/$pic3"), fit: BoxFit.cover),
              border: Border.all(color: Colors.black, width: 1)),
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width / 3 - 15,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/$pic4"), fit: BoxFit.cover),
              border: Border.all(color: Colors.black, width: 1)),
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
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3)
        ),
        child: Icon(icon, color: Colors.white,),
      ),
      SizedBox(
        height: 10,
      ),
      Text("$label", style: TextStyle(fontFamily: "Quicksand"),)
    ],
  );
}
