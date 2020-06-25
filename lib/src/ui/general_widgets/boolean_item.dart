import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upbaseexercise/src/ui/general_widgets/option_items.dart';
import 'package:upbaseexercise/src/utils/colors.dart';
import 'package:upbaseexercise/src/values/values.dart';

class BooleanItem extends StatelessWidget {
  const BooleanItem(this.title, this.value, this.onChanged, {this.switchKey});

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  // [switchKey] is used for accessing the switch from driver tests.
  final Key switchKey;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final double textScaleFactor = MediaQuery.textScaleFactorOf(context);

    return OptionsItem(
      child: Row(
        children: <Widget>[
          Expanded(child: Text(title, style: theme.primaryTextTheme.subtitle)),
          CupertinoSwitch(
            key: switchKey,
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primaryElement,
//            co: isDark ? Colors.white30 : Colors.black26,
          ),
        ],
      ),
    );
  }
}
