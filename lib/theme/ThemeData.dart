import 'package:flutter/material.dart';
import 'package:rate_my_bistro/components/CutCornersBorder.dart';
import 'package:rate_my_bistro/theme/Colors.dart';

/// The Application's global design
///
/// Composes common values like the theme
/// and colors
///
/// @author Ansgar Sachs <ansgar.sachs@cgm.com>
///
class BistroDesign {
  static final theme = _buildBistroTheme();
  static final colors = BistroColors();

  /// Creates a common base for widget designs
  ///
  /// @return the application's theme
  ///
  static ThemeData _buildBistroTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      primaryColor: colors.kBistroYellow,
      scaffoldBackgroundColor: colors.kBistroSurfaceWhite,
      buttonTheme: base.buttonTheme.copyWith(
          buttonColor: colors.kBistroYellow,
          textTheme: ButtonTextTheme.primary,
          colorScheme:
              ColorScheme.light().copyWith(primary: colors.kBistroYellow)),
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(
          headline: TextStyle(
              fontFamily: 'Rubik', fontSize: 48, fontWeight: FontWeight.normal),
          title: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 24,
              fontWeight: FontWeight.normal),
          body1: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.white),
          body2: TextStyle(
              fontFamily: 'Rubik', fontSize: 20, fontWeight: FontWeight.normal),
        ),
      ),
      textTheme: _buildBistroTextTheme(base.textTheme),
      primaryTextTheme: _buildBistroTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildBistroTextTheme(base.accentTextTheme),
      primaryIconTheme:
          base.iconTheme.copyWith(color: colors.kBistroSurfaceWhite),
      inputDecorationTheme: InputDecorationTheme(
        border: CutCornersBorder(),
      ),
    );
  }

  /// Creates a common base for any Text related theme
  ///
  /// @return common text theme
  ///
  static TextTheme _buildBistroTextTheme(TextTheme base) {
    return base
        .copyWith(
            headline: base.headline.copyWith(
              fontWeight: FontWeight.w500,
            ),
            title: base.title.copyWith(fontSize: 18.0),
            caption: base.caption.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
            ),
            body2: base.body2.copyWith(color: Colors.white))
        .apply(fontFamily: 'Raleway');
  }
}
