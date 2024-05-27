import 'package:flutter/material.dart';

Widget containerWidget(IconData iconData) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 4,
          // changes position of shadow
        ),
      ],
    ),
    child: CircleAvatar(
      radius: 18, // You can adjust the size here
      backgroundColor: Colors.white,
      child: Icon(
        iconData,

        size: 22, // You can adjust the icon size here
      ),
    ),
  );
}
