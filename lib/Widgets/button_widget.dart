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
      borderRadius: BorderRadius.circular(12),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xfffe5900),
          Color(0xfffd5900),
        ],
      ),
    ),
    child: Center(
      child: Text(
        text,
        style: GoogleFonts.quicksand(
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 17.sp,
          ),
        ),
      ),
    ),
  );
}
