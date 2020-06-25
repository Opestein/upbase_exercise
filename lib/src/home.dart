// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:upbaseexercise/src/app.dart';
import 'package:upbaseexercise/src/application.dart';
import 'package:upbaseexercise/src/ui/settings/widget/option/options.dart';
import 'package:upbaseexercise/src/ui/splashscreen/splashscreen.dart';
import 'package:upbaseexercise/src/values/values.dart';

class UpbaseHome extends StatelessWidget {
  SettingOptions options;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    final provider = UpbaseApp.of(context);

    replacementUrlA = provider.url;
    replacementApiKey = provider.apiKey;

    options = provider.options;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        }
      },
      child: MaterialApp(
          theme: options.theme.data.copyWith(),
          title: 'HiDog',
          color: AppColors.primaryElement,
          debugShowCheckedModeBanner: false,
          navigatorObservers: [
//        FirebaseAnalyticsObserver(analytics: analytics),
          ],
          localizationsDelegates: [
            options.appTranslationsDelegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: application.supportedLocales(),
//      showPerformanceOverlay: options.showPerformanceOverlay,
//      checkerboardOffscreenLayers: options.showOffscreenLayersCheckerboard,
//      checkerboardRasterCacheImages: options.showRasterCacheImagesCheckerboard,
//      routes: _buildRoutes(),
          builder: (BuildContext context, Widget child) {
            return Directionality(
              textDirection: options.textDirection,
              child: provider.applyTextScaleFactor(
                  // Specifically use a blank Cupertino theme here and do not transfer
                  // over the Material primary color etc except the brightness to
                  // showcase standard iOS looks.
                  CupertinoTheme(
                data: CupertinoThemeData(
                  brightness: options.theme.data.brightness,
                ),
                child: child,
              )),
            );
          },
          home: SplashScreen()
//          ,navigatorObservers: [routeObserver],
//      ),
          ),
    );
  }
}
