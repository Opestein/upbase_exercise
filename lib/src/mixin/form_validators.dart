import 'dart:async';

const String kEmailRule = r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";
//const String _kMin8CharsOneLetterOneNumber =
//    r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
const String kMin8CharsOneLetterOneNumberOnSpecialCharacter =
    r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
//const String _kMin8CharsOneUpperLetterOneLowerLetterOnNumber = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$";
//const String _kMin8CharsOneUpperOneLowerOneNumberOneSpecial =
//    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";
//const String _kMin8Max10OneUpperOneLowerOneNumberOneSpecial = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,10}$";

class FormValidators {
  bool validateEmail(String email) {
    final RegExp emailExp = new RegExp(kEmailRule);
    if (email != null) email = email.trim();
    if (!emailExp.hasMatch(email) || email.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  bool validateUserName(String username) {
    if (username.isEmpty || username.length < 2) {
      return false;
    } else {
      return true;
    }
  }

  bool validatePhone(String phone) {
    if (phone.isEmpty || phone.length < 10) {
      return false;
    } else {
      return true;
    }
  }

  bool validatePassword(String password) {
    if (password.isEmpty || password.length < 7) {
      return false;
    } else {
      return true;
    }
  }

  bool validateSingleInput(String username) {
    if (username.isEmpty || username.length < 1) {
      return false;
    } else {
      return true;
    }
  }

  bool validateToken(String token) {
    if (token.isEmpty || token.length < 6) {
      return false;
    } else {
      return true;
    }
  }

  bool validateCreditCardNo(String number) {
    if (number.isEmpty || number.length < 16) {
      return false;
    } else {
      return true;
    }
  }

  bool validateExpiryDate(String number) {
    if (number.isEmpty || number.length < 5) {
      return false;
    } else {
      return true;
    }
  }

  bool validateCVV(String number) {
    if (number.isEmpty || number.length < 3) {
      return false;
    } else {
      return true;
    }
  }

  bool validateBVN(String number) {
    if (number.isEmpty || number.length < 11) {
      return false;
    } else {
      return true;
    }
  }

  final validateEmailBloc =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    final RegExp emailExp = new RegExp(kEmailRule);
    if (emailExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email');
    }
  });
  final validateEmailAndPhoneBloc =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    final RegExp emailExp = new RegExp(kEmailRule);
    if (emailExp.hasMatch(email) || email.length > 10) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email or phone number');
    }
  });

  final StreamTransformer<String, String> validatePasswordBloc =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (password, sink) {
    final RegExp passwordExp =
        new RegExp(kMin8CharsOneLetterOneNumberOnSpecialCharacter);

    if (!passwordExp.hasMatch(password)) {
      sink.addError(
          'Minimum 8 characters. At least 1 letter, 1 number and 1 symbol');
    } else {
      sink.add(password);
    }
  });

//  final validatePasswordBloc = StreamTransformer<String, String>.fromHandlers(
//      handleData: (password, sink) {
//    if (password.length > 6) {
//      sink.add(password);
//    } else {
//      sink.addError('Invalid password, please enter more than 6 characters');
//    }
//  });

  final validateConfirmPasswordBloc =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (password, sink) {
    if (password.length > 6) {
      sink.add(password);
    } else {
      sink.addError(
          'Minimum 8 characters. At least 1 letter, 1 number and 1 symbol');
    }
  });

  final validatePhoneBloc = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 10) {
      sink.add(password);
    } else {
      sink.addError('Validating phone number, please enter 11 digits');
    }
  });

  final validateFirstNameBloc = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 1) {
      sink.add(password);
    } else {
      sink.addError('Invalid first name');
    }
  });

  final validateLastNameBloc = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 1) {
      sink.add(password);
    } else {
      sink.addError('Invalid last name');
    }
  });
  final validateAddressBloc = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 1) {
      sink.add(password);
    } else {
      sink.addError('Invalid address');
    }
  });

  final validateTokenBloc = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 5) {
      sink.add(password);
    } else {
      sink.addError('Invalid token, please enter 6 characters');
    }
  });

  final validateSingleInputBloc =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (password, sink) {
    if (password.length > 1) {
      sink.add(password);
    } else {
      sink.addError('Invalid field, please enter more than 1 characters');
    }
  });
}

/*class EmailValidator {
  final StreamTransformer<String,String> validateEmail =
  StreamTransformer<String,String>.fromHandlers(handleData: (email, sink){
    final RegExp emailExp = new RegExp(_kEmailRule);

    if (!emailExp.hasMatch(email) || email.isEmpty){
      sink.addError('Entre a valid email');
    } else {
      sink.add(email);
    }
  });
}*/
