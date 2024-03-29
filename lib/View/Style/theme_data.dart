import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/View/Style/color.dart';

ThemeData appTheme() => ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    textTheme:
        TextTheme(bodyText2: GoogleFonts.montserrat(color: Colors.black)),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.montserrat(color: AppColor.grey),
      floatingLabelStyle: GoogleFonts.montserrat(color: AppColor.grey),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColor.greyLight, width: 2),
        gapPadding: 5,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColor.greyLight, width: 2),
        gapPadding: 5,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColor.greyLight, width: 2),
        gapPadding: 5,
      ),
    ),
    // BUTTONS
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        fixedSize: MaterialStateProperty.all(const Size(double.maxFinite, 50)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        foregroundColor: MaterialStateProperty.all(AppColor.greenDark),
        backgroundColor: MaterialStateProperty.all(AppColor.greenLight),
        overlayColor: MaterialStateProperty.all(AppColor.greenLight),
        textStyle: MaterialStateProperty.all(
             GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 15)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
      fixedSize: MaterialStateProperty.all(const Size(double.maxFinite, 50)),
      side: MaterialStateProperty.all(BorderSide(
        color: AppColor.greenLight,
        width: 2,
      )),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      overlayColor: MaterialStateProperty.all(AppColor.greenLight),
      foregroundColor: MaterialStateProperty.all(AppColor.greenDark),
      textStyle: MaterialStateProperty.all(
          GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 15)),
    )),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(AppColor.grey),
            overlayColor: MaterialStateProperty.all(AppColor.greenLight))));
