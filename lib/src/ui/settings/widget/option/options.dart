// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:upbaseexercise/src/app_translations.dart';
import 'package:upbaseexercise/src/application.dart';
import 'package:upbaseexercise/src/ui/general_widgets/boolean_item.dart';
import 'package:upbaseexercise/src/ui/settings/widget/text_font/scales.dart';
import 'package:upbaseexercise/src/ui/settings/widget/theme/themes.dart';

class SettingOptions {
  SettingOptions({
    this.appTranslationsDelegate,
    this.notification,
    this.theme,
    this.textScaleFactor,
    this.textDirection = TextDirection.ltr,
    this.timeDilation = 1.0,
    this.platform,
    this.showOffscreenLayersCheckerboard = false,
    this.showRasterCacheImagesCheckerboard = false,
    this.showPerformanceOverlay = false,
  });

  final AppTranslationsDelegate appTranslationsDelegate;
  final bool notification;
  final UpbaseTheme theme;
  final UpbaseTextScaleValue textScaleFactor;
  final TextDirection textDirection;
  final double timeDilation;
  final TargetPlatform platform;
  final bool showPerformanceOverlay;
  final bool showRasterCacheImagesCheckerboard;
  final bool showOffscreenLayersCheckerboard;

  SettingOptions copyWith({
    AppTranslationsDelegate appTranslationsDelegate,
    bool notification,
    UpbaseTheme theme,
    UpbaseTextScaleValue textScaleFactor,
    TextDirection textDirection,
    double timeDilation,
    TargetPlatform platform,
    bool showPerformanceOverlay,
    bool showRasterCacheImagesCheckerboard,
    bool showOffscreenLayersCheckerboard,
  }) {
    return SettingOptions(
      appTranslationsDelegate: appTranslationsDelegate ??
          AppTranslationsDelegate(
              newLocale: application.supportedLocales().first),
      notification: notification ?? this.notification,
      theme: theme ?? this.theme,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      textDirection: textDirection ?? this.textDirection,
      timeDilation: timeDilation ?? this.timeDilation,
      platform: platform ?? this.platform,
      showPerformanceOverlay:
          showPerformanceOverlay ?? this.showPerformanceOverlay,
      showOffscreenLayersCheckerboard: showOffscreenLayersCheckerboard ??
          this.showOffscreenLayersCheckerboard,
      showRasterCacheImagesCheckerboard: showRasterCacheImagesCheckerboard ??
          this.showRasterCacheImagesCheckerboard,
    );
  }

  @override
  bool operator ==(dynamic other) {
    if (runtimeType != other.runtimeType) return false;
    final SettingOptions typedOther = other;
    return appTranslationsDelegate == typedOther.appTranslationsDelegate &&
        notification == typedOther.notification &&
        theme == typedOther.theme &&
        textScaleFactor == typedOther.textScaleFactor &&
        textDirection == typedOther.textDirection &&
        platform == typedOther.platform &&
        showPerformanceOverlay == typedOther.showPerformanceOverlay &&
        showRasterCacheImagesCheckerboard ==
            typedOther.showRasterCacheImagesCheckerboard &&
        showOffscreenLayersCheckerboard ==
            typedOther.showRasterCacheImagesCheckerboard;
  }

  @override
  int get hashCode => hashValues(
        appTranslationsDelegate,
        notification,
        theme,
        textScaleFactor,
        textDirection,
        timeDilation,
        platform,
        showPerformanceOverlay,
        showRasterCacheImagesCheckerboard,
        showOffscreenLayersCheckerboard,
      );

  @override
  String toString() {
    return '$runtimeType($theme)';
  }
}

//class _ActionItem extends StatelessWidget {
//  const _ActionItem(this.text, this.onTap);
//
//  final String text;
//  final VoidCallback onTap;
//
//  @override
//  Widget build(BuildContext context) {
//    return _OptionsItem(
//      child: _FlatButton(
//        onPressed: onTap,
//        child: Text(text),
//      ),
//    );
//  }
//}

class _TimeDilationItem extends StatelessWidget {
  const _TimeDilationItem(this.options, this.onOptionsChanged);

  final SettingOptions options;
  final ValueChanged<SettingOptions> onOptionsChanged;

  @override
  Widget build(BuildContext context) {
    return BooleanItem(
      'Slow motion',
      options.timeDilation != 1.0,
      (bool value) {
        onOptionsChanged(
          options.copyWith(
            timeDilation: value ? 20.0 : 1.0,
          ),
        );
      },
      switchKey: const Key('slow_motion'),
    );
  }
}

//class _TextDirectionItem extends StatelessWidget {
//  const _TextDirectionItem(this.options, this.onOptionsChanged);
//
//  final SettingOptions options;
//  final ValueChanged<SettingOptions> onOptionsChanged;
//
//  @override
//  Widget build(BuildContext context) {
//    return _BooleanItem(
//      'Force RTL',
//      options.textDirection == TextDirection.rtl,
//      (bool value) {
//        onOptionsChanged(
//          options.copyWith(
//            textDirection: value ? TextDirection.rtl : TextDirection.ltr,
//          ),
//        );
//      },
//      switchKey: const Key('text_direction'),
//    );
//  }
//}

//class _PlatformItem extends StatelessWidget {
//  const _PlatformItem(this.options, this.onOptionsChanged);
//
//  final SettingOptions options;
//  final ValueChanged<SettingOptions> onOptionsChanged;
//
//  String _platformLabel(TargetPlatform platform) {
//    switch(platform) {
//      case TargetPlatform.android:
//        return 'Mountain View';
//      case TargetPlatform.fuchsia:
//        return 'Fuchsia';
//      case TargetPlatform.iOS:
//        return 'Cupertino';
//    }
//    assert(false);
//    return null;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return _OptionsItem(
//      child: Row(
//        children: <Widget>[
//          Expanded(
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                const Text('Platform mechanics'),
//                 Text(
//                   '${_platformLabel(options.platform)}',
//                   style: Theme.of(context).primaryTextTheme.body1,
//                 ),
//              ],
//            ),
//          ),
//          PopupMenuButton<TargetPlatform>(
//            padding: const EdgeInsetsDirectional.only(end: 16.0),
//            icon: const Icon(Icons.arrow_drop_down),
//            itemBuilder: (BuildContext context) {
//              return TargetPlatform.values.map((TargetPlatform platform) {
//                return PopupMenuItem<TargetPlatform>(
//                  value: platform,
//                  child: Text(_platformLabel(platform)),
//                );
//              }).toList();
//            },
//            onSelected: (TargetPlatform platform) {
//              onOptionsChanged(
//                options.copyWith(platform: platform),
//              );
//            },
//          ),
//        ],
//      ),
//    );
//  }
//}

//class GalleryOptionsPage extends StatelessWidget {
//  const GalleryOptionsPage({
//    Key key,
//    this.options,
//    this.onOptionsChanged,
//    this.onSendFeedback,
//  }) : super(key: key);
//
//  final SettingOptions options;
//  final ValueChanged<SettingOptions> onOptionsChanged;
//  final VoidCallback onSendFeedback;
//
//  List<Widget> _enabledDiagnosticItems() {
//    // Boolean showFoo options with a value of null: don't display
//    // the showFoo option at all.
//    if (options.showOffscreenLayersCheckerboard == null &&
//        options.showRasterCacheImagesCheckerboard == null &&
//        options.showPerformanceOverlay == null)
//      return const <Widget>[];
//
//    final List<Widget> items = <Widget>[
//      const Divider(),
//      const _Heading('Diagnostics'),
//    ];
//
//    if (options.showOffscreenLayersCheckerboard != null) {
//      items.add(
//        _BooleanItem(
//          'Highlight offscreen layers',
//          options.showOffscreenLayersCheckerboard,
//          (bool value) {
//            onOptionsChanged(options.copyWith(showOffscreenLayersCheckerboard: value));
//          },
//        ),
//      );
//    }
//    if (options.showRasterCacheImagesCheckerboard != null) {
//      items.add(
//        _BooleanItem(
//          'Highlight raster cache images',
//          options.showRasterCacheImagesCheckerboard,
//          (bool value) {
//            onOptionsChanged(options.copyWith(showRasterCacheImagesCheckerboard: value));
//          },
//        ),
//      );
//    }
//    if (options.showPerformanceOverlay != null) {
//      items.add(
//        _BooleanItem(
//          'Show performance overlay',
//          options.showPerformanceOverlay,
//          (bool value) {
//            onOptionsChanged(options.copyWith(showPerformanceOverlay: value));
//          },
//        ),
//      );
//    }
//
//    return items;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    final ThemeData theme = Theme.of(context);
//
//    return DefaultTextStyle(
//      style: theme.primaryTextTheme.subhead,
//      child: ListView(
//        padding: const EdgeInsets.only(bottom: 124.0),
//        children: <Widget>[
//          const _Heading('Display'),
//          _ThemeItem(options, onOptionsChanged),
//          _TextScaleFactorItem(options, onOptionsChanged),
//          _TextDirectionItem(options, onOptionsChanged),
//          _TimeDilationItem(options, onOptionsChanged),
//          const Divider(),
//          const _Heading('Platform mechanics'),
//          _PlatformItem(options, onOptionsChanged),
//        ]..addAll(
//          _enabledDiagnosticItems(),
//        )..addAll(
//          <Widget>[
//            const Divider(),
//            const _Heading('Flutter gallery'),
//            _ActionItem('Send feedback', onSendFeedback),
//          ],
//        ),
//      ),
//    );
//  }
//}
