import 'dart:math';

import 'package:flutter/material.dart';
import 'package:upbaseexercise/src/app.dart';
import 'package:intl/intl.dart';
import 'package:upbaseexercise/src/ui/search_result_page.dart';

double responsiveWidth(context, double width) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);

  double blockHorizontal = _mediaQueryData.size.width / 100;
  double actualWidth = width * blockHorizontal;

  return actualWidth;
}

double responsiveHeight(context, double height) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);

  double blockVertical = _mediaQueryData.size.height / 100;
  double actualHeight = height * blockVertical;

  return actualHeight;
}

double safeAreaWidth(context, double width) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);

  double safeAreaHorizontal =
      _mediaQueryData.padding.left + _mediaQueryData.padding.right;

  double safeAreaBlockHorizontal =
      (_mediaQueryData.size.width - safeAreaHorizontal) / 100;
  double actualWidth = width * safeAreaBlockHorizontal;

  return actualWidth;
}

double safeAreaHeight(context, double height) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);

  double safeAreaVertical =
      _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

  double safeAreaBlockVertical =
      (_mediaQueryData.size.height - safeAreaVertical) / 100;
  double actualHeight = height * safeAreaBlockVertical;

  return actualHeight;
}

double scaledHeight(BuildContext context, double baseSize) {
  return baseSize * (MediaQuery.of(context).size.height / 800);
}

double scaledWidth(BuildContext context, double baseSize) {
  return baseSize * (MediaQuery.of(context).size.width / 375);
}

double _singleUnit;
double _scaleFactor;
const noOfUnits = 480.0;

_setSingleUnit(context) {
  _singleUnit = MediaQuery.of(context).size.width;
  _scaleFactor = MediaQuery.of(context).textScaleFactor;
}

double textFontSize(context, double size) {
  double _scaleFactor = MediaQuery.of(context).textScaleFactor;
  return (size) / _scaleFactor;
}

//fontSize using textScaleFactor
double singleTextUnit(BuildContext context, double size) {
  if (_scaleFactor == null) _setSingleUnit(context);
  return (size) / _scaleFactor;
}

String randomString(int stringLength) {
  const chars = "abcdefghijklmnopqrstuvwxyz0123456789";

  Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
  String result = "";
  for (var i = 0; i < stringLength; i++) {
    result += chars[rnd.nextInt(chars.length)];
  }
  return result;
}

const _days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

const _months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

const _shortMonths = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sept',
  'Oct',
  'Nov',
  'Dec'
];

const _shortDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

String getUrlToUse(String url) {
  return url.replaceAll('url', replacementUrlA);
}

String getApiKeyToUse(String url) {
  return url.replaceAll('key', replacementApiKey);
}

int getDayOfMonth(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return date.day;
}

String getDayOfWeek(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return _days[date.weekday - 1];
}

String getMonthOfYear(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return _months[date.month - 1];
}

String getDayDDmm(int dateValue) {
  //Thu, 09 May
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return '${_shortDays[date.weekday - 1]}, ${beautifyDay(date.day)} ${_shortMonths[date.month - 1]}';
}

String beautifyDay(int day) {
  if (day < 10)
    return '0$day';
  else
    return '$day';
}

int nextDay(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  date.add(Duration(days: 1));
  return date.millisecondsSinceEpoch;
  ;
}

DateTime getCurrentDate(String dateValue) {
  var date = DateFormat('yyyy-MM-dd')
      .parse(dateValue.replaceAll('T00:00:00.000Z', ''));
  return date;
}

String getLongDate(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return DateFormat('EEE, MMM d, yyyy').format(date);
}

String getLongDateB(String dateValue) {
  var date = DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateValue);
  return DateFormat('EEE, d MMM yyyy').format(date);
}

String getLongDateC(String dateValue) {
  var date = DateTime.parse(dateValue);
  return DateFormat('dd MMM, yyyy').format(date);
}

String getLongDateD(String dateValue) {
  var date = DateTime.parse(dateValue);
  return DateFormat('EEE, d MMM yyyy HH:mm:ss').format(date);
}

String getLongDateE(String dateValue) {
  var date = DateTime.parse(dateValue);
  return DateFormat('EEE, d MMM yyyy').format(date);
}

String getLongDateF(String dateValue) {
  var date = DateTime.parse(dateValue);
  return DateFormat('MMM dd, yyyy').format(date);
}

String get12Hour(DateTime dateValue) {
  var date = DateFormat.jm().format(dateValue);
  return date;
}

String getLongDateRange(String dateValue) {
  var date = DateTime.parse(dateValue);
  return DateFormat('MMMM dd, yyyy').format(date);
}

String getMonthDate(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return DateFormat('MMM, dd').format(date);
}

String get24hrsFromString(String dateValue) {
  var date = DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateValue);
  return get24hrs(date.millisecondsSinceEpoch);
}

String get24hrs(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return DateFormat('HH:mm:ss').format(date);
}

String getDay(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return DateFormat('dd:').format(date);
}

String getDuration(String original) {
  var values = original.split(':');
  if (values[0].contains('.')) {
    var subValues = values[0].split('.');
    values[0] =
        ((int.parse(subValues[0]) * 24) + int.parse(subValues[1])).toString();
  }
  return '${values[0]}h ${values[1]}m';
}

String simpleDateA(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return DateFormat('yyyy-MM-dd').format(date);
}

String simpleDateB(String dateValue) {
  var date = DateTime.parse(dateValue);
  return DateFormat('dd/MM/yy').format(date);
}

String getLongDayDateFromString(String dateValue) {
  var date =
      DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateValue.replaceAll('T', ' '));
  return getLongDayDate(date.millisecondsSinceEpoch);
}

String getLongDayDate(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return DateFormat('EEE, d MMM yyyy').format(date);
}

String getLongDay(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return DateFormat('EEEE, d MMMM, yyyy').format(date);
}

String getSubmitDate(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return DateFormat('MM/dd/yyyy').format(date);
}

String formattedMoney(double value) {
  return NumberFormat('#,###.##').format(value);
}

String formatted(double value) {
  return NumberFormat('###').format(value);
}

DateTime getTenYearsFromDateTime(DateTime dateTime) {
  //Adds ten years and a month to the passed DateTime,
  //Setting the day to zero returns the previous month's last day
  DateTime tenYearsFromDateTime =
      DateTime(dateTime.year + 10, dateTime.month + 1, 0);
  return tenYearsFromDateTime;
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

String naira = '₦';
String dollar = '\$';

String camelCase(String input) {
  if (input == null) {
    return '';
  }
  if (input.length < 2) {
    return input;
  }
  return input[0].toUpperCase() + input.substring(1);
}

String lastDayOfMonth(int month) {
  var now = DateTime.now();

// Find the last day of the month.
  var lastDayDateTime = (now.month < 12)
      ? DateTime(now.year, now.month + month, 0)
      : DateTime(now.year + 1, month, 0);

//  Find beginning of next month
//  var beginningNextMonth = (now.month < 12) ? new DateTime(now.year, now.month + 1, 1) :  DateTime(now.year + 1, 1, 1);

  return getLongDateE(lastDayDateTime.toIso8601String());
}

String buildPhotoURL(String photoReference) {
  return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${photoReference}&key=${kGoogleApiKey}";
}
