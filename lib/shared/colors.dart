import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomColors {
  static const Color text = Colors.black;
  static const Color background = Colors.white; // Color.fromARGB(255, 200, 200, 200);
  static const Color backgroundAccent = Color.fromARGB(255, 78, 58, 59);
  static const Color brightAccent = Color.fromARGB(255, 250, 84, 87);
  static const Color darkAccent = Color.fromARGB(255, 166, 91, 95);

  static const Color div = Color.fromARGB(255, 207, 207, 207);
  static const Color searchbar = Color.fromARGB(255, 237, 237, 237);
  static const Color hint = Color.fromARGB(255, 90, 90, 90);

  static const Color navbar = Color.fromARGB(255, 200, 200, 200);
  static const Brightness systemBrightness = Brightness.dark;
}

changeNavbarColor() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: CustomColors.systemBrightness,
    statusBarBrightness: CustomColors.systemBrightness,
    statusBarIconBrightness: CustomColors.systemBrightness,
    systemNavigationBarColor: CustomColors.navbar,
  ));
}
