import 'package:flutter/material.dart';

final apiUrl = "https://school-realtime.herokuapp.com";

final kBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  border: Border.all(width: 1, color: Colors.blue),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final inputBoxDecoration = BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(color: Colors.black12, blurRadius: 6.0, offset: Offset(0, 2))
    ]);
final txtStyle =
    TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold);

final boxHeader = BoxDecoration(
  color: primaryColor,
  border: Border.all(width: 1, color: white),
  borderRadius: BorderRadius.circular(8),
);

final titleStyle = (double size) {
  return TextStyle(
    color: blackColor,
    fontSize: size,
    fontWeight: FontWeight.w700,
  );
};

const whiteColor = Color(0xFFFFFFFF);
const grey4Color = Color(0xFFFBDBDBD);
const grey2Color = Color(0xFFF4F4F4F);
const greyColor = Color(0xFFF2F2F2);
const superLightColor = Color(0xFFE1F1FF);
const blackColor = Color(0xFF333333);

final primaryColor = Color(0xFF1E88E5);
final lightColor = Color(0xFF6ab7ff);
final grayColor = Color(0xFFa6a6a4);
final darkColor = Color(0xFF005cb2);
final white = Color(0xFFffffff);
final black = Color(0xFF000000);

final masukC = Color(0xFFB4FF7F);
final izinC = Color(0xFFF2C94C);
final telatC = Color(0xFFFC7EC2);
final alpaC = Color(0xFFFC7E7E);
