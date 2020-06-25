// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:upbaseexercise/src/utils/colors.dart';
import 'package:upbaseexercise/src/utils/const.dart';
import 'package:upbaseexercise/src/values/values.dart';

class UpbaseTheme {
  const UpbaseTheme._(this.name, this.data);

  final String name;
  final ThemeData data;
}

final UpbaseTheme kDarkUpbaseTheme = UpbaseTheme._('Dark', _buildDarkTheme());
final UpbaseTheme kLightUpbaseTheme =
    UpbaseTheme._('Light', _buildLightTheme());

TextTheme _buildLightTextTheme(TextTheme base) {
  return base
      .copyWith(
        title: base.title.copyWith(
          fontFamily: kDefaultFontFamily,
          color: Color(0xFF2e2e2e),
        ),
        subhead: base.title.copyWith(
            color: Color(0xFF2e2e2e),
            fontFamily: kDefaultFontFamily,
            fontStyle: FontStyle.normal),
        button: base.title.copyWith(
            color: Color(0xFF2e2e2e),
            fontFamily: kDefaultFontFamily,
            fontStyle: FontStyle.normal),
        display1: base.title.copyWith(
            color: Color(0xFF2e2e2e),
            fontFamily: kDefaultFontFamily,
            fontStyle: FontStyle.normal),
        body1: base.body1.copyWith(
            color: Color(0xFF2e2e2e),
            fontFamily: kDefaultFontFamily,
            fontSize: 16,
            height: 1.4,
            fontStyle: FontStyle.normal),
        body2: base.body2.copyWith(
            color: Color(0xFF2e2e2e),
            fontFamily: kDefaultFontFamily,
            fontStyle: FontStyle.normal),
        display2: base.title.copyWith(
            color: Color(0xFF2e2e2e),
            fontFamily: kDefaultFontFamily,
            fontStyle: FontStyle.normal),
        display3: base.title.copyWith(
            color: Color(0xFF2e2e2e),
            fontFamily: kDefaultFontFamily,
            fontStyle: FontStyle.normal),
        display4: base.title.copyWith(
            color: Color(0xFF2e2e2e),
            fontFamily: kDefaultFontFamily,
            fontStyle: FontStyle.normal),
        headline: base.title.copyWith(
            color: Color(0xFF2e2e2e),
            fontFamily: kDefaultFontFamily,
            fontStyle: FontStyle.normal),
        overline: base.title.copyWith(
            color: Color(0xFF2e2e2e),
            fontFamily: kDefaultFontFamily,
            fontStyle: FontStyle.normal),
        subtitle: base.title.copyWith(
            color: Color(0xFF2e2e2e),
            fontFamily: kDefaultFontFamily,
            fontStyle: FontStyle.normal),
        caption: base.title.copyWith(
            color: Color(0xFF2e2e2e),
            fontFamily: kDefaultFontFamily,
            fontStyle: FontStyle.normal),
      )
      .apply(
        bodyColor: Color(0xFF2e2e2e),
      );
}

TextTheme _buildDarkTextTheme(TextTheme base) {
  return base.copyWith(
      title: base.title.copyWith(
          fontFamily: kDefaultFontFamily, fontStyle: FontStyle.normal),
      subhead: base.title.copyWith(
          color: AppColors.secondaryText,
          fontFamily: kDefaultFontFamily,
          fontStyle: FontStyle.normal),
      button: base.title.copyWith(
          color: AppColors.secondaryText,
          fontFamily: kDefaultFontFamily,
          fontStyle: FontStyle.normal),
      display1: base.title.copyWith(
          color: AppColors.secondaryText,
          fontFamily: kDefaultFontFamily,
          fontStyle: FontStyle.normal),
      body1: base.body1.copyWith(
          color: AppColors.secondaryText,
          fontFamily: kDefaultFontFamily,
          fontStyle: FontStyle.normal),
      body2: base.body2.copyWith(
          color: AppColors.secondaryText,
          fontFamily: kDefaultFontFamily,
          fontStyle: FontStyle.normal),
      display2: base.title.copyWith(
          color: AppColors.secondaryText,
          fontFamily: kDefaultFontFamily,
          fontStyle: FontStyle.normal),
      display3: base.title.copyWith(
          color: AppColors.secondaryText,
          fontFamily: kDefaultFontFamily,
          fontStyle: FontStyle.normal),
      display4: base.title.copyWith(
          color: AppColors.secondaryText,
          fontFamily: kDefaultFontFamily,
          fontStyle: FontStyle.normal),
      headline: base.title.copyWith(
          color: AppColors.secondaryText,
          fontFamily: kDefaultFontFamily,
          fontStyle: FontStyle.normal),
      overline: base.title.copyWith(
          color: AppColors.secondaryText,
          fontFamily: kDefaultFontFamily,
          fontStyle: FontStyle.normal),
      subtitle: base.title.copyWith(
          color: AppColors.secondaryText,
          fontFamily: kDefaultFontFamily,
          fontStyle: FontStyle.normal),
      caption: base.title.copyWith(
          color: AppColors.secondaryText,
          fontFamily: kDefaultFontFamily,
          fontStyle: FontStyle.normal));
}

ThemeData _buildDarkTheme() {
//  const Color primaryColor = Color(0xFF0175c2);
//  const Color secondaryColor = Color(0xFF13B9FD);
  final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
    primary: AppColors.primaryText.withOpacity(0.8),
    secondary: AppColors.primaryText.withOpacity(0.8),
  );
  final ThemeData base = ThemeData(
      brightness: Brightness.dark,
      accentColorBrightness: Brightness.dark,
      primaryColor: AppColors.primaryDarkBackground,
      primaryColorDark: AppColors.primaryDarkBackground,
      primaryColorLight: AppColors.primaryDarkBackground,
      buttonColor: AppColors.secondaryDarkBackground,
      indicatorColor: AppColors.secondaryText,
      toggleableActiveColor: AppColors.secondaryDarkBackground,
      accentColor: AppColors.secondaryDarkBackground,
      splashColor: AppColors.secondaryDarkBackground,
      splashFactory: InkRipple.splashFactory,
      canvasColor: AppColors.primaryElement.withOpacity(0.7),
      scaffoldBackgroundColor: AppColors.primaryText.withOpacity(0.4),
      backgroundColor: AppColors.primaryText.withOpacity(0.4),
      errorColor: const Color(0xFFB00020),
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: AppColors.secondaryText)),
      iconTheme: IconThemeData(
        color: AppColors.ternaryElement,
      ),
      buttonTheme: ButtonThemeData(
          splashColor: AppColors.primaryElement,
          colorScheme: colorScheme,
          textTheme: ButtonTextTheme.primary,
          buttonColor: AppColors.secondaryDarkBackground),
      cardColor: AppColors.primaryText.withOpacity(0.4),
      textSelectionColor: AppColors.secondaryText);
  return base.copyWith(
    appBarTheme: AppBarTheme(
        color: AppColors.primaryElement,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: AppColors.primaryText.withOpacity(0.8),
        ),
        textTheme: TextTheme(
          title: base.textTheme.title.copyWith(
              fontFamily: kDefaultFontFamily, fontStyle: FontStyle.normal),
        ),
        actionsIconTheme:
            IconThemeData(color: AppColors.primaryText.withOpacity(0.8))),
    textTheme: _buildDarkTextTheme(base.textTheme),
    primaryTextTheme: _buildDarkTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildDarkTextTheme(base.accentTextTheme),
    primaryIconTheme: base.primaryIconTheme.copyWith(
      color: AppColors.secondaryDarkBackground,
    ),
  );
}

ThemeData _buildLightTheme() {
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: AppColors.primaryElement,
    secondary: AppColors.secondaryElement,
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    accentColorBrightness: Brightness.light,
    colorScheme: colorScheme,
    primaryColor: AppColors.primaryElement,
    buttonColor: AppColors.secondaryElement,
    indicatorColor: Colors.black,
    toggleableActiveColor: AppColors.secondaryElement,
    splashColor: AppColors.secondaryElement,
    splashFactory: InkRipple.splashFactory,
    accentColor: AppColors.secondaryElement,
    canvasColor: AppColors.primaryElement,
    scaffoldBackgroundColor: AppColors.secondaryText,
    backgroundColor: AppColors.secondaryText,
    errorColor: const Color(0xFFB00020),
    accentIconTheme: IconThemeData(color: AppColors.secondaryElement),
    primaryIconTheme: IconThemeData(
      color: AppColors.secondaryElement,
    ),
    iconTheme: IconThemeData(
      color: AppColors.secondaryElement,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black),
    ),
    buttonTheme: ButtonThemeData(
        splashColor: AppColors.primaryElement,
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.normal,
        buttonColor: AppColors.primaryElement),
    cardColor: AppColors.secondaryText,
    textSelectionColor: Colors.black45,
  );
  return base.copyWith(
    appBarTheme: AppBarTheme(
        color: AppColors.primaryElement,
        brightness: Brightness.dark,
        iconTheme: IconThemeData(
          color: AppColors.secondaryText,
        ),
        textTheme: TextTheme(
          title: base.textTheme.title.copyWith(
            fontFamily: kDefaultFontFamily,
            color: AppColors.secondaryText,
          ),
        ),
        actionsIconTheme: IconThemeData(color: AppColors.secondaryText)),
    textTheme: _buildLightTextTheme(base.textTheme),
    primaryTextTheme: _buildLightTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildLightTextTheme(base.accentTextTheme),
    primaryIconTheme: base.primaryIconTheme.copyWith(
      color: AppColors.secondaryElement,
    ),
  );
}
