// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) => LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color gronyLight;
  Color gronyLighter;
  Color green;
  Color blue;
  Color redi;
  Color grayLight;
  Color gray;
  Color orange;

  TextStyle get title1 => GoogleFonts.getFont(
        'Montserrat',
        color: primaryColor,
        fontWeight: FontWeight.w800,
        fontSize: 26,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Montserrat',
        color: primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 23,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Montserrat',
        color: primaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Montserrat',
        color: primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Montserrat',
        color: primaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Montserrat',
        color: primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Montserrat',
        color: primaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 13,
      );
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF0B1E1B);
  Color secondaryColor = const Color(0xFF00A193);
  Color tertiaryColor = const Color(0xFFFFFFFF);
  Color alternate = const Color(0x00000000);
  Color primaryBackground = const Color(0x00000000);
  Color secondaryBackground = const Color(0x00000000);
  Color primaryText = const Color(0x00000000);
  Color secondaryText = const Color(0x00000000);

  Color gronyLight = Color(0xFF23D0C1);
  Color gronyLighter = Color(0xFFACF1EC);
  Color green = Color(0xFF5EC913);
  Color blue = Color(0xFF0F9CFF);
  Color redi = Color(0xFFE25606);
  Color grayLight = Color(0xFFEEF1F0);
  Color gray = Color(0xFFA5A5A5);
  Color orange = Color(0xFFF77303);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    TextDecoration decoration,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
