import 'package:flutter/material.dart';
// pubspec.yaml 파일에 등록 했던 폰트 관련 패키지를 import
import 'package:google_fonts/google_fonts.dart';

// Flutter에서 기본적으로 정의되어 있는 textTheme의 속성들을 우리가 사용할 스타일로 재정의
TextTheme textTheme() {
  return TextTheme(
    headline1: GoogleFonts.openSans(fontSize: 18.0, color: Colors.black),
    headline2: GoogleFonts.openSans(
        fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    bodyText1: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black),
    bodyText2: GoogleFonts.openSans(fontSize: 14.0, color: Colors.grey),
    subtitle1: GoogleFonts.openSans(fontSize: 15.0, color: Colors.black),
  );
}

// Appbar스타일 미리 정의
AppBarTheme appBarTheme() {
  return AppBarTheme(
    centerTitle: false,
    color: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  );
}

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    appBarTheme: appBarTheme(),
    colorScheme: ColorScheme.light(
      primary: Colors.orange,
    ),
  );
}
