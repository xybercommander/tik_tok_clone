import 'package:flutter/material.dart';

Widget accountThumnails(context, int likes, String pic) {
  return Container(
    height: 200,
    // width: 20,
    width: MediaQuery.of(context).size.width / 3 - 20,
    // color: Colors.green,
    decoration: BoxDecoration(
      color: Colors.red,
      // image: DecorationImage(image: AssetImage("assets/$pic"))
    ),
  );
}
