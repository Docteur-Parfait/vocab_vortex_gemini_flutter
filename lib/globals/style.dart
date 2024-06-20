import 'package:flutter/material.dart';

class ColorStyles {
  const ColorStyles._();
  static const Color kPrimary = Color.fromRGBO(94, 23, 234, 1);
  static const Color kSecondary = Color.fromARGB(255, 255, 196, 23);
  static const Color kBackground = Color.fromRGBO(253, 254, 253, 1);
  static const Color kWhite = Color(0xffffffff);

  static const Color kAccent = Color.fromARGB(255, 4, 135, 3);

  static const Color kBlack = Color(0xff000000);
  static const Color kBlack0D = Color(0xff0d0d0d);
  static const Color kDark = Color.fromARGB(255, 10, 12, 52);

  static const Color kGrey = Color(0xffD7D7D7);
  static const Color kGreyB7 = Color(0xffB7B7B7);
  static const Color kGrey8E = Color(0xff8E8E8E);
  static const Color kGrey83 = Color(0xff838383);
  static const Color kGrey85 = Color(0xff858585);

  static const Color kGreen = Color.fromRGBO(10, 94, 33, 1);

  static const Color kBlue = Color(0xff0A8ED9);
  static const Color kRed = Color.fromARGB(255, 217, 10, 10);
  static const Color kOrange = Colors.orange;
  static const Color kRose = Color.fromARGB(255, 173, 146, 146);
  static const Color kLightBlue = Color.fromRGBO(220, 240, 225, 1);
}

TextStyle? globalTextStyle(
    {FontWeight? fontWeight, double? fontSize, Color? color}) {
  return TextStyle(
      fontFamily: "borsok",
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize);
}
