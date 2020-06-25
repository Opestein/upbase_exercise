import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:upbaseexercise/src/app_config.dart';
import 'package:upbaseexercise/src/app_translations.dart';
import 'package:upbaseexercise/src/application.dart';
import 'package:upbaseexercise/src/ui/settings/widget/option/options.dart';
import 'package:upbaseexercise/src/ui/settings/widget/text_font/scales.dart';
import 'package:upbaseexercise/src/ui/settings/widget/theme/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

String replacementUrlA;
String replacementApiKey;

//PackageInfo packageInfo;

final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();

class UpbaseApp<B> extends StatefulWidget {
  final void Function(BuildContext context, B bloc) onDispose;
  final B Function(BuildContext context, B bloc) builder;
  final SharedPreferences preferences;
  final Dio dio;
  final Widget child;
  final String url;
  final String apiKey;

  static UpbaseAppState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AppConfig) as AppConfig)
        .upbaseAppState;
  }

  UpbaseApp(
      {Key key,
      @required this.child,
      this.preferences,
      this.dio,
      this.builder,
      this.onDispose,
      this.url,
      this.apiKey})
      : super(key: key);
  createState() => UpbaseAppState<B>(preferences, dio, url, apiKey);
}

class UpbaseAppState<B> extends State<UpbaseApp<B>> {
  final SharedPreferences preferences;
  final Dio dio;
  final String url;
  final String apiKey;

  UpbaseAppState(this.preferences, this.dio, this.url, this.apiKey);
  SettingOptions options;
  Timer timeDilationTimer;
  B bloc;
  Key key = UniqueKey();

  @override
  void initState() {
    super.initState();
    if (widget.builder != null) {
      bloc = widget.builder(context, bloc);
    }
    options = SettingOptions(
      appTranslationsDelegate: AppTranslationsDelegate(
          newLocale: application.supportedLocales().first),
      notification: false,
      theme: kLightUpbaseTheme,
      textScaleFactor: kAllUpbaseTextScaleValues[0],
      timeDilation: timeDilation,
      platform: defaultTargetPlatform,
    );
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose(context, bloc);
    }
    timeDilationTimer?.cancel();
    timeDilationTimer = null;
    super.dispose();
  }

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  handleOptionsChanged(SettingOptions newOptions) {
    if (options.timeDilation != newOptions.timeDilation) {
      timeDilationTimer?.cancel();
      timeDilationTimer = null;
      if (newOptions.timeDilation > 1.0) {
        // We delay the time dilation change long enough that the user can see
        // that UI has started reacting and then we slam on the brakes so that
        // they see that the time is in fact now dilated.
        timeDilationTimer = Timer(const Duration(milliseconds: 150), () {
          timeDilation = newOptions.timeDilation;
        });
      } else {
        timeDilation = newOptions.timeDilation;
      }
    }
    setState(() {
      options = newOptions;
    });
  }

  Widget applyTextScaleFactor(Widget child) {
    return Builder(
      builder: (BuildContext context) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
              textScaleFactor: options.textScaleFactor.scale,
              alwaysUse24HourFormat: true),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    var config = AppConfig.of(context);
//    replacementUrlA = widget.url;
//    replacementApiKey = widget.apiKey;

    return AppConfig(
      bloc: bloc,
      key: key,
      dio: dio,
      preferences: preferences,
      upbaseAppState: this,
      child: widget.child,
    );
  }
}
