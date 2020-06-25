import 'package:flutter/rendering.dart';

class Gradients {
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment(0.5, 0),
    end: Alignment(0.5, 1),
    stops: [
      0,
      0.46804,
      1,
    ],
    colors: [
      Color.fromARGB(255, 245, 81, 96),
      Color.fromARGB(255, 205, 45, 64),
      Color.fromARGB(255, 160, 4, 28),
    ],
  );
  static const Gradient secondaryGradient = LinearGradient(
    begin: Alignment(0.33444, 0.32055),
    end: Alignment(0.97621, 1.02178),
    stops: [
      0,
      1,
      1,
    ],
    colors: [
      Color.fromARGB(255, 34, 113, 211),
      Color.fromARGB(248, 32, 187, 198),
      Color.fromARGB(128, 0, 0, 0),
    ],
  );
//  static const Gradient registrationGradient = LinearGradient(
//    begin: Alignment(0.38156, -0.05014),
//    end: Alignment(0.61125, 1.05451),
//    stops: [
//      0,
//      0.11901,
//      0.26107,
//      0.42323,
//      0.75304,
//      1,
//    ],
//    colors: [
//      Color.fromARGB(219, 203, 203, 203),
//      Color.fromARGB(219, 200, 200, 200),
//      Color.fromARGB(219, 198, 195, 195),
//      Color.fromARGB(219, 183, 166, 185),
//      Color.fromARGB(219, 214, 247, 214),
//      Color.fromARGB(219, 156, 155, 156),
//    ],
//  );

  static const Gradient registrationGradient = LinearGradient(
    begin: Alignment(0.18156, -0.9914),
    end: Alignment(0.91125, 1.35451),
    stops: [
      0,
      0.05901,
      0.16107,
      0.36107,
      0.62323,
      0.84304,
      1,
    ],
    colors: [
      Color.fromARGB(219, 203, 203, 203),
      Color.fromARGB(219, 200, 200, 200),
      Color.fromARGB(219, 198, 195, 195),
      Color.fromARGB(219, 183, 166, 185),
      Color.fromARGB(219, 214, 247, 214),
      Color.fromARGB(219, 156, 155, 156),
      Color.fromARGB(219, 203, 203, 203),
    ],
  );

  static const Gradient buttonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0,
      1,
    ],
    colors: [Color(0xFFC32AFF), Color(0xFF9013FE)],
  );
}
