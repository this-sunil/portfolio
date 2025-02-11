import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AppConstant{
  static const String appName="My Portfolio";
  static const String name="Sunil Shedge";
  static const String headingText="Flutter Developer";
  static const String phoneNumber="+918668796251";
  static const String linkedIn="https://www.linkedin.com/in/sunilshedge";
  static const String emailAddress="swarajya888@gmail.com";
  static Color appColor=Color(0xFF333945);
  static Color blueColor=Color(0xFF21B6A8);
  static const Color greenColor=Colors.green;
  static Color indigoColor=Colors.indigo;
  static Color whiteColor=Colors.white;
  static Color blackColor=Colors.black;
  static Color orangeColor=Colors.orange;

  Future<void> launchUri(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.platformDefault,

    )) {
      throw Exception('Could not launch $url');
    }
  }
}


extension MediaQueryExtension on BuildContext{
  double get width=>MediaQuery.sizeOf(this).width;
  double get height=>MediaQuery.sizeOf(this).height;
}
extension TextStyleExtension on BuildContext {

  TextStyle get style => GoogleFonts.bitter();

  FontWeight get bold => FontWeight.bold;
  FontWeight get semibold => FontWeight.w500;
  FontWeight get medium => FontWeight.w400;
  FontWeight get small => FontWeight.w300;

  TextStyle copyWithStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    Color? decorationColor,
    TextStyle? styleOverride,
  }) {

    return (styleOverride ?? style).copyWith(
      fontFamily: GoogleFonts.bitter().fontFamily,
      color: color,
      fontSize: fontSize ?? 16.0,
      fontWeight: fontWeight,
      decoration: decoration,
      decorationColor: decorationColor
    );
  }
}
