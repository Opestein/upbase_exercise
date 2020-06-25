import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upbaseexercise/src/values/values.dart';

//  platform dependant icon
final IconData kBackIcon =
    Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios;

final IconData kForwardIcon =
    Platform.isAndroid ? Icons.arrow_forward : Icons.arrow_forward_ios;

const String kDummyImageURL = 'https://www.google.com';

const double kMaxPhoneWidth = 450;
const double kDefaultPadding = 24.0;

final String kDefaultFontFamily =
    Platform.isIOS ? 'Gill Sans Std' : 'Gill Sans';
const kBoldWeight = FontWeight.w800;
const kHeavyWeight = FontWeight.w900;
const kBookWeight = FontWeight.w400;
const kMediumNormal = FontWeight.w600;
const kMediumCondensed = FontWeight.w700;
const kLightWeight = FontWeight.w300;

typedef OnClickCallback();

class NoDataItem extends StatelessWidget {
  final Widget leading;
  final String title;
  final OnClickCallback onClickCallback;
  final String buttonTitle;

  NoDataItem(
      {this.leading = const Icon(
        Icons.info_outline,
        color: Colors.grey,
        size: 32,
      ),
      this.title = 'No Data Available',
      this.onClickCallback,
      this.buttonTitle = 'Retry'});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        leading,
        SizedBox(
          height: 18,
        ),
        Text(
          title,
          style: theme.textTheme.body2.copyWith(color: AppColors.primaryText),
        ),
        SizedBox(
          height: 24,
        ),
        GestureDetector(
          onTap: () {
            if (onClickCallback != null) {
              onClickCallback();
            }
          },
          child: Container(
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.dashboardColor,
            ),
            alignment: Alignment.center,
            child: Text(
              buttonTitle,
              style: theme.textTheme.body1.copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
