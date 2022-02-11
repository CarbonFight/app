import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: avoid_classes_with_only_static_members
class FlutterFlowTheme {
  static const Color primaryColor = Color(0xFF0B1E1B);
  static const Color secondaryColor = Color(0xFF00A193);
  static const Color tertiaryColor = Color(0xFFFFFFFF);

  static const Color gronyLight = Color(0xFF23D0C1);
  static const Color gronyLighter = Color(0xFFACF1EC);
  static const Color green = Color(0xFF5EC913);
  static const Color blue = Color(0xFF0F9CFF);
  static const Color redi = Color(0xFFE25606);
  static const Color grayLight = Color(0xFFEEF1F0);
  static const Color gray = Color(0xFFA5A5A5);
  static const Color orange = Color(0xFFF77303);

  String primaryFontFamily = 'Poppins';
  String secondaryFontFamily = 'Roboto';
  static TextStyle get title1 => GoogleFonts.getFont(
        'Montserrat',
        color: primaryColor,
        fontWeight: FontWeight.w800,
        fontSize: 26,
      );
  static TextStyle get title2 => GoogleFonts.getFont(
        'Montserrat',
        color: primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 23,
      );
  static TextStyle get title3 => GoogleFonts.getFont(
        'Montserrat',
        color: primaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  static TextStyle get subtitle1 => GoogleFonts.getFont(
        'Montserrat',
        color: primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      );
  static TextStyle get subtitle2 => GoogleFonts.getFont(
        'Montserrat',
        color: primaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );
  static TextStyle get bodyText1 => GoogleFonts.getFont(
        'Montserrat',
        color: primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );
  static TextStyle get bodyText2 => GoogleFonts.getFont(
        'Montserrat',
        color: primaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 13,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              height: lineHeight,
            );
}
