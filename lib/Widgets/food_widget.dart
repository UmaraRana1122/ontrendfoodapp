import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget foodWidget(String image, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    child: Column(
      children: [
        Image.asset(
          image,
          height: 7.h,
        ),
        SizedBox(height: 1.h),
        Text(
          text,
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w700,
              fontSize: 15.sp,
            ),
          ),
        ),
      ],
    ),
  );
}
