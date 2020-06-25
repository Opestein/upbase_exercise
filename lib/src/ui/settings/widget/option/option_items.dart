import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:upbaseexercise/src/app.dart';
import 'package:upbaseexercise/src/ui/settings/widget/change_language/language_item.dart';
import 'package:upbaseexercise/src/ui/settings/widget/option/options.dart';
import 'package:upbaseexercise/src/ui/settings/widget/text_font/text_font_item.dart';
import 'package:upbaseexercise/src/ui/settings/widget/theme/theme_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OptionItem extends StatefulWidget {
  final SharedPreferences preferences;
  final http.Client client;
  final SettingOptions options;

  OptionItem(this.preferences, this.client, this.options);

  @override
  _OptionItemState createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final bool isDark = theme.brightness == Brightness.dark;

    final provider = UpbaseApp.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
            color: isDark ? Colors.black45 : Colors.white,
            borderRadius: BorderRadius.circular(15)),
        width: double.infinity,
//                      height: 210,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Options",
              style: theme.primaryTextTheme.headline5,
            ),
            SizedBox(
              height: 15,
            ),
//            NotificationItem(widget.options),
//            SizedBox(
//              height: 10,
//            ),
            ThemeItem(widget.options),
            SizedBox(
              height: 10,
            ),
            LanguageItem(
              widget.options,
            ),
            SizedBox(
              height: 10,
            ),
            TextScaleFactorItem(
              widget.options,
            )
          ],
        ),
      ),
    );
  }
}
