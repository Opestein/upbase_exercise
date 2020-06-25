import 'package:flutter/material.dart';
import 'package:upbaseexercise/src/app.dart';
import 'package:upbaseexercise/src/ui/general_widgets/option_items.dart';
import 'package:upbaseexercise/src/ui/settings/widget/option/options.dart';
import 'package:upbaseexercise/src/ui/settings/widget/text_font/scales.dart';
import 'package:upbaseexercise/src/utils/colors.dart';
import 'package:upbaseexercise/src/values/values.dart';

class TextScaleFactorItem extends StatefulWidget {
  const TextScaleFactorItem(
    this.options,
  );

  final SettingOptions options;

  @override
  _TextScaleFactorItemState createState() => _TextScaleFactorItemState();
}

class _TextScaleFactorItemState extends State<TextScaleFactorItem> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final bool isDark = theme.brightness == Brightness.dark;

    final provider = UpbaseApp.of(context);

    return OptionsItem(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Text size',
                  style: theme.primaryTextTheme.subhead,
                ),
                Text(
                  '${widget.options.textScaleFactor.label}',
                  style: theme.primaryTextTheme.body1,
//                  Theme.of(context).primaryTextTheme.body1,
                ),
              ],
            ),
          ),
          PopupMenuButton<UpbaseTextScaleValue>(
            padding: const EdgeInsetsDirectional.only(end: 16.0),
            icon: const Icon(Icons.arrow_drop_down),
            color: AppColors.primaryElement,
            itemBuilder: (BuildContext context) {
              return kAllUpbaseTextScaleValues
                  .map<PopupMenuItem<UpbaseTextScaleValue>>(
                      (UpbaseTextScaleValue scaleValue) {
                return PopupMenuItem<UpbaseTextScaleValue>(
                  value: scaleValue,
                  child: Text(
                    scaleValue.label,
                  ),
                );
              }).toList();
            },
            onSelected: (UpbaseTextScaleValue scaleValue) {
              setState(() {
                provider.handleOptionsChanged(
                  widget.options.copyWith(textScaleFactor: scaleValue),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
