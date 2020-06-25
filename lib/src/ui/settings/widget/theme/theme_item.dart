import 'package:flutter/material.dart';
import 'package:upbaseexercise/src/app.dart';
import 'package:upbaseexercise/src/ui/general_widgets/boolean_item.dart';
import 'package:upbaseexercise/src/ui/settings/widget/option/options.dart';
import 'package:upbaseexercise/src/ui/settings/widget/theme/themes.dart';

class ThemeItem extends StatefulWidget {
  const ThemeItem(
    this.options,
  );

  final SettingOptions options;

  @override
  _ThemeItemState createState() => _ThemeItemState();
}

class _ThemeItemState extends State<ThemeItem> {
  @override
  Widget build(BuildContext context) {
    final provider = UpbaseApp.of(context);

    return BooleanItem(
      'Dark Theme',
      widget.options.theme == kDarkUpbaseTheme,
      (bool value) {
        setState(() {
          print(value.toString());
          provider.handleOptionsChanged(widget.options.copyWith(
            theme: value ? kDarkUpbaseTheme : kLightUpbaseTheme,
          ));
        });
      },
      switchKey: const Key('dark_theme'),
    );
  }
}
