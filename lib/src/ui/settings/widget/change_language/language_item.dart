import 'package:flutter/material.dart';
import 'package:upbaseexercise/src/app.dart';
import 'package:upbaseexercise/src/app_translations.dart';
import 'package:upbaseexercise/src/application.dart';
import 'package:upbaseexercise/src/ui/general_widgets/option_items.dart';
import 'package:upbaseexercise/src/ui/settings/widget/change_language/languages.dart';
import 'package:upbaseexercise/src/ui/settings/widget/option/options.dart';
import 'package:upbaseexercise/src/utils/colors.dart';
import 'package:upbaseexercise/src/values/values.dart';

class LanguageItem extends StatefulWidget {
  const LanguageItem(
    this.options,
  );

  final SettingOptions options;

  @override
  _LanguageItemState createState() => _LanguageItemState();
}

class _LanguageItemState extends State<LanguageItem> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    final provider = UpbaseApp.of(context);

    return OptionsItem(
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Column(
//              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Language', style: theme.primaryTextTheme.subhead),
                Text(
                  '${application.supportedLocales().elementAt(index).toLanguageTag().substring(3)}',
                  style: theme.primaryTextTheme.body1,

//                  Theme.of(context).primaryTextTheme.body1,
                ),
              ],
            ),
          ),
//          Spacer(),
          PopupMenuButton<UpbaseLanguages>(
            padding: const EdgeInsetsDirectional.only(end: 16.0),
            color: AppColors.primaryElement,
            icon: const Icon(Icons.arrow_drop_down),
            itemBuilder: (BuildContext context) {
              return kAllUpbaseLanguageValues
                  .map<PopupMenuItem<UpbaseLanguages>>(
                      (UpbaseLanguages languages) {
                return PopupMenuItem<UpbaseLanguages>(
                  value: languages,
                  child: Text(
                    languages.label,
                  ),
                );
              }).toList();
            },
            onSelected: (UpbaseLanguages languages) {
              setState(() {
                index = languages.index;
                provider.handleOptionsChanged(
                  widget.options.copyWith(
                      appTranslationsDelegate: AppTranslationsDelegate(
                          newLocale: application
                              .supportedLocales()
                              .elementAt(languages.index))),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
