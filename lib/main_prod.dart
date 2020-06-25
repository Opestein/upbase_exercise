import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upbaseexercise/src/app.dart';
import 'package:upbaseexercise/src/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var preferences = await SharedPreferences.getInstance();
  Dio dio = Dio();

  var configuredApp = UpbaseApp(
    dio: dio,
    preferences: preferences,
    child: UpbaseHome(),
    url: '',
    apiKey: '',
  );

  ErrorWidget.builder = (FlutterErrorDetails details) => Container();

  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(configuredApp));
}
