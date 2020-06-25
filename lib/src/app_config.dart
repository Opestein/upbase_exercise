import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:upbaseexercise/src/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Type _getType<B>() => B;

class AppConfig<B> extends InheritedWidget {
  final B bloc;
  final SharedPreferences preferences;
  final Dio dio;
  final String replacementUrlA;
  final String replacementUrlB;
  final UpbaseAppState upbaseAppState;

  const AppConfig({
    Key key,
    this.bloc,
    this.preferences,
    this.dio,
    this.replacementUrlA,
    this.replacementUrlB,
    this.upbaseAppState,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(AppConfig<B> oldWidget) {
    return true;
  }

  static B of<B>(BuildContext context) {
    final type = _getType<AppConfig<B>>();
    final AppConfig<B> provider = context.inheritFromWidgetOfExactType(type);

    return provider.bloc;
  }
}
