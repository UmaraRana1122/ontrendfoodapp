import 'package:flutter/material.dart';
import 'package:ontrendfoodapp/Utils/main_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget toprestaurantsWidget(BuildContext context, String isImage, String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: MediaQuery.of(context).size.width * 0.46,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(isImage), // Replace with your image URL
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.46,
            height: MediaQuery.of(context).size.height * 0.25,
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
                Row(
                  children: [
                    Text(
                      "40-45 min",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Spacer(),
                    Container(
                        height: 2.5.h,
                        width: 12.w,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Row(
                            children: [
                              Text(
                                "4.1",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "QuicksandSemiBold",
                                  color: MainColor.colorWhite,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 15,
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
