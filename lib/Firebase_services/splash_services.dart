import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ontrendfoodapp/Posts/post_screen.dart';
import 'package:ontrendfoodapp/Screens/auth/login_screen.dart';
import 'package:ontrendfoodapp/Screens/home_screen.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    //check if the user is already login or not
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostScreen()),
              ));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              ));
    }
  }
}
