import 'package:flutter/material.dart';

final apiUrl = "https://school-realtime.herokuapp.com/";
final primaryC = Color(0xff1E88E5);
final lightC = Color(0xff6ab7ff);
final dartC = Color(0xff005cb2);
final grayC = Color(0xffa6a6a4);
final blackC = Color(0xff000000);
final whiteC = Color(0xffffffff);

final masukC = Color(0xffB4FF7F);
final izinC = Color(0xffF2C94C);
final telatC = Color(0xffFC7EC2);
final alpaC = Color(0xffFC7E7E);

final kBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(width: 1, color: Colors.blue),
    boxShadow: [
      BoxShadow(color: Colors.black12, blurRadius: 6.0, offset: Offset(0, 2))
    ]);

final inputBoxDecoration = BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(color: Colors.black12, blurRadius: 6.0, offset: Offset(0, 2))
    ]);
final txtStyle =
    TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold);

final boxHeader = BoxDecoration(
  color: primaryC,
  border: Border.all(width: 1, color: whiteC),
  borderRadius: BorderRadius.circular(8),
);

final bkotak = (Color color) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(5),
  );
};

final titleStyle = (double size) {
  return TextStyle(
    color: whiteC,
    fontSize: size,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
  );
};

final txt = (double size, Color color) {
  return TextStyle(
    color: color,
    fontSize: size,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );
};

final topTxt = (double size) {
  return TextStyle(
      fontSize: size,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      color: blackC);
};

final txtChild = (double size, Color color) {
  return TextStyle(
    color: color,
    fontSize: size,
  );
};
