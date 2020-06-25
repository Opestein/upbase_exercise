import 'package:flutter/material.dart';
import 'package:upbaseexercise/src/app_translations.dart';

typedef OperationCompleted(Operation operation);

class Operation {
  final dynamic _result;
  final int code;
  Operation(this.code, this._result);

  bool get shouldDisplayMessage {
    if (code == 0)
      return false;
    else if (_result == null)
      return false;
    else
      return true;
  }

  String getMessage(BuildContext context) {
    if (code == 0 || code == 500)
      return AppTranslations.of(context).text('no_connection');
    else if (code == 408)
      return AppTranslations.of(context).text('timeout_text');
    else
      return '$_result';
  }

  bool get succeeded => code >= 200 && code <= 226;
  dynamic get result => _result;
}
