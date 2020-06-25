import 'dart:async';

import 'package:flutter/material.dart';
import 'package:upbaseexercise/src/ui/home_fragment.dart';

class SplashHelper {
  BuildContext _authContext;

  Future checkFirstScreen(
    BuildContext context,
  ) async {
    this._authContext = context;

    var _duration = new Duration(seconds: 4);
    Timer(_duration, navigationPageLoggedIn);
  }

  navigationPageLoggedIn() async {
    Navigator.pushReplacement(
      _authContext,
      MaterialPageRoute(
          builder: (context) => HomeFragment(),
          settings: RouteSettings(name: HomeFragment.routeName)),
    );
  }
}
