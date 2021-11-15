import 'package:expense_tracker_gsheets/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const Color greenClr = Color(0xFF32ba7c);
const Color darkGreyClr = Color(0xFF292D32);
Color darkHeaderClr = Color(0XFF424242);
const Color white = Colors.white;
const Color primaryClr = bluishClr;

class Themes {
  static final light = ThemeData(
    backgroundColor: Colors.grey[300],
    primaryColor: primaryClr,
    primarySwatch: Colors.grey,
    brightness: Brightness.light,
    primaryColorLight: Colors.white.withOpacity(0.8),
    primaryColorDark: Colors.black.withOpacity(0.1),
    cardColor: Colors.grey[400],
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black54)),
  );
  static final dark = ThemeData(
    backgroundColor: darkGreyClr,
    primaryColor: darkGreyClr,
    primarySwatch: Colors.grey,
    brightness: Brightness.dark,
    primaryColorLight: Colors.white.withOpacity(0.1),
    primaryColorDark: Colors.black.withOpacity(0.4),
    cardColor: darkGreyClr.withOpacity(0.6),
  );
}

TextStyle get plusButton {
  return TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w300,
    color: ThemeService.instance.isDarkMode() ? Colors.white : darkHeaderClr,
  );
}

TextStyle get headingStyle {
  return GoogleFonts.montserratAlternates(
      textStyle: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w300,
    color: ThemeService.instance.isDarkMode()
        ? Colors.grey[600]
        : darkHeaderClr.withOpacity(.7),
  ));
}

TextStyle get subheadingStyle {
  return GoogleFonts.montserratAlternates(
      textStyle: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: ThemeService.instance.isDarkMode()
        ? Colors.grey[600]
        : darkHeaderClr.withOpacity(.7),
  ));
}

TextStyle get headingMoneyStyle {
  return GoogleFonts.montserratAlternates(
      textStyle: TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w300,
    color: ThemeService.instance.isDarkMode() ? Colors.grey : darkHeaderClr,
  ));
}

TextStyle get titleStyle {
  return GoogleFonts.montserratAlternates(
      textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: ThemeService.instance.isDarkMode() ? Colors.grey : darkHeaderClr,
  ));
}
