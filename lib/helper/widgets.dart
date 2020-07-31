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
