// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

const Color kBackGroundColor = Color(0xffF8F8F8);
const Color kPrimaryColor = Colors.blue;
const Color kTextBlack = Color(0xff2E2F37);
const Color kGrey = Color(0xffBCBCBC);
const Color kWhite = Color(0xFFFFFFFF);
const Color kBlack = Color(0xff000000);
const Color kDarkGrey = Color(0xff3c3c44);
const kLightGrayButtonColor = Color(0xffDADADA);

TextStyle kLargeTitleStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
}

TextStyle kTitleStyleBold(Color color) {
  return TextStyle(
    color: color,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}

TextStyle kTitleStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
}

TextStyle kContentStyleBold(Color color) {
  return TextStyle(
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}

TextStyle kContentStyleThin(Color color) {
  return TextStyle(
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
