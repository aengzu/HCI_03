import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// NOTE: 어플의 테마, 폰트를 관리합니다

// 앱의 전반적인 테마를 정의
ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    appBarTheme: appTheme(),
    primaryColor: Colors.green,
  );
}

// AppBarTheme 정의
AppBarTheme appTheme() {
  return AppBarTheme(
      centerTitle: false,
      color: Colors.white,
      elevation: 0.0,
      titleTextStyle: textTheme().titleMedium);
}

// 사용자 정의 폰트 (Noto Sans Korean)
TextTheme textTheme() {
  return const TextTheme(
    // DisplayLarge 텍스트 스타일.
    displayLarge:
        TextStyle(fontFamily: 'NotoSansKR', fontSize: 24, color: Colors.black),
    // 버튼
    displayMedium: TextStyle(
        fontFamily: 'NotoSansKR',
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w100),
    // BodyLarge 텍스트 스타일.
    bodyLarge: TextStyle(
      fontFamily: 'NotoSansKR',
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
    ), // BodyMedium 텍스트 스타일.
    bodyMedium: TextStyle(
      fontFamily: 'NotoSansKR',
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    // TitleLarge 텍스트 스타일.
    titleMedium: TextStyle(
        fontFamily: 'NotoSansKR',
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold),
  );
}
