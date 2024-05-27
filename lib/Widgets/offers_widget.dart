import 'package:flutter/material.dart';

Widget offersWidget(BuildContext context, String image, String text,
    String text2, String text3) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.46,
    height: MediaQuery.of(context).size.height * 0.17,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(
        image: AssetImage(image), // Replace with your image URL
        fit: BoxFit.cover,
      ),
    ),
    child: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.46,
          height: MediaQuery.of(context).size.height * 0.17,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.6),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                text2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'OMR 10',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '  OMR 50',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
