import 'package:flutter/material.dart';

import '../supplemental/CutCornersBorder.dart';

import 'Colors.dart';

final bistroTheme = _buildBistroTheme();

ThemeData _buildBistroTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: kBistroYellow,
    buttonTheme: base.buttonTheme.copyWith(
        buttonColor: kBistroYellow,
        textTheme: ButtonTextTheme.primary,
        colorScheme: ColorScheme.light().copyWith(primary: kBistroYellow)
    ),
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline: TextStyle(fontFamily: 'Rubik', fontSize: 48, fontWeight: FontWeight.normal),
        title: TextStyle(fontFamily: 'Pacifico', fontSize: 24, fontWeight: FontWeight.normal),
        body1: TextStyle(fontFamily: 'Rubik', fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white),
        body2: TextStyle(fontFamily: 'Rubik', fontSize: 20, fontWeight: FontWeight.normal),
      ),
    ),
    scaffoldBackgroundColor: kBistroSurfaceWhite,
    textTheme: _buildBistroTextTheme(base.textTheme),
    primaryTextTheme: _buildBistroTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildBistroTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(
        color: kBistroSurfaceWhite
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: CutCornersBorder(),
    ),
  );
}

TextTheme _buildBistroTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
        fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    body2: base.body2.copyWith(
      color: Colors.white
    )
  ).apply(
    fontFamily: 'Raleway',
  );
}