import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upbaseexercise/src/utils/const.dart';
import 'package:upbaseexercise/src/values/values.dart';

typedef ValidatorCallback(String value);

typedef OnTapCallback();

class EditTextGeneral extends StatefulWidget {
  final TextEditingController controller;
  final ValidatorCallback validatorCallback;
  final OnTapCallback onTapCallback;
  final ValidatorCallback onChangedCallback;
  final String labelText;
  final String hintText;
  final Color textColor;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Color labelColor;
  final Color hintColor;
  final Widget prefix;
  final String prefixFamily;
  final List<TextInputFormatter> inputFormatter;
  final bool enabled;
  final Color prefixColor;
  final String errorText;

  const EditTextGeneral(
      {@required this.controller,
      @required this.validatorCallback,
      @required this.labelText,
      @required this.hintText,
      @required this.textInputType,
      this.onChangedCallback,
      this.inputFormatter,
      this.enabled = true,
      this.onTapCallback,
      this.prefix,
      this.errorText,
      this.textInputAction = TextInputAction.done,
      this.textColor = AppColors.primaryText,
      this.labelColor = AppColors.primaryText,
      this.hintColor = Colors.black,
      this.prefixColor = AppColors.primaryText,
      this.prefixFamily});

  @override
  State<StatefulWidget> createState() => EditTextGeneralState();
}

class EditTextGeneralState extends State<EditTextGeneral> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    MediaQueryData mediaQuery;
    mediaQuery = MediaQuery.of(context);

    var shortestSide = mediaQuery.size.shortestSide;
// Determine if we should use mobile layout or not. The
// number 600 here is a common breakpoint for a typical
// 7-inch tablet.
    final bool useMobileLayout = shortestSide < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          widget.labelText,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white60,
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        TextFormField(
            controller: widget.controller,
            keyboardType: widget.textInputType,
            enabled: widget.enabled,
            maxLines: 1,
            style: theme.primaryTextTheme.bodyText1
                .copyWith(color: widget.textColor, fontWeight: FontWeight.w500),
            validator: widget.validatorCallback,
            inputFormatters: widget.inputFormatter,
            onTap: widget.onTapCallback,
            onChanged: widget.onChangedCallback,
            textInputAction: widget.textInputAction,
            onEditingComplete: () => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              prefix: widget.prefix,
              hintText: widget.hintText,
              hintStyle: theme.primaryTextTheme.bodyText2.copyWith(
                  color: widget.hintColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
              labelStyle: theme.primaryTextTheme.subtitle1.copyWith(
                  color: widget.labelColor, fontWeight: FontWeight.w600),
              errorText: widget.errorText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: AppColors.fourthBackground.withOpacity(0.24468),
                  width: 0.4,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: AppColors.fourthBackground.withOpacity(0.64468),
                  width: 0.4,
                  style: BorderStyle.solid,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: AppColors.fourthBackground.withOpacity(0.24468),
                  width: 0.4,
                ),
              ),
            )),
      ],
    );
  }
}
