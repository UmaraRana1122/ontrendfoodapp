import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget buttonWidget(
  double height,
  double width,
  String text,
) {
  return Container(
    height: height.h,
    width: width.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black)),
    child: Center(
      child: Text(
        text,
        style: GoogleFonts.quicksand(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 17.sp,
          ),
        ),
      ),
    ),
  );
}
