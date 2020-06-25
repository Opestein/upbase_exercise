import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upbaseexercise/src/utils/const.dart';
import 'package:upbaseexercise/src/values/values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatelessWidget {
  final SharedPreferences preferences;
  final Dio dio;

  SettingPage(
    this.preferences,
    this.dio,
  );
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    MediaQueryData mediaQuery;
    mediaQuery = MediaQuery.of(context);

    var shortestSide = mediaQuery.size.shortestSide;
// Determine if we should use mobile layout or not. The
// number 600 here is a common breakpoint for a typical
// 7-inch tablet.
    final bool useMobileLayout = shortestSide < 600;

    // TODO: implement build
    return Scaffold(
        backgroundColor: AppColors.primaryElement,
        resizeToAvoidBottomInset: false,
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: double.infinity,
            child: SafeArea(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Icon(
                          kBackIcon,
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                    Text(
                      'Settings',
                      style: theme.textTheme.title,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.transparent,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 10),
                        child: Text(
                          "APP SETTINGS",
                          style: theme.textTheme.body1
                              .copyWith(color: Color(0xFF838383)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ))));
  }
}
