import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_firebase/View/Auth/LoginScreen.dart';

import '../View/Auth/SignupScreen.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    });
  }
}
