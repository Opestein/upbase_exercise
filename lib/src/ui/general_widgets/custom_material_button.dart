import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upbaseexercise/src/values/values.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton(
      {this.key,
      @required this.title,
      @required this.onPressed,
      this.height = 60,
      this.color = AppColors.primaryElement,
      this.textColor = AppColors.secondaryText,
      this.minWidth = double.infinity,
      this.borderRadius = Radii.k10pxRadius,
      this.elevation = 1});

  final Key key;
  final String title;
  final Function() onPressed;
  final double height;
  final Color color;
  final Color textColor;
  final BorderRadiusGeometry borderRadius;
  final double minWidth;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return MaterialButton(
      padding: EdgeInsets.zero,
      elevation: elevation,
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      minWidth: minWidth,
      height: height,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      child: Text(
        title,
        key: key,
        textAlign: TextAlign.center,
        style: theme.textTheme.subhead.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
