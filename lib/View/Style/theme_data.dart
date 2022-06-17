import 'package:flutter/material.dart';
import 'package:learn_for_business_app/View/Style/color.dart';

ThemeData appTheme() => ThemeData.light().copyWith(
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppColor.grey),
      floatingLabelStyle: TextStyle(color: AppColor.grey),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColor.greyLight, width: 2),
        gapPadding: 5,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColor.greyLight, width: 2),
        gapPadding: 5,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColor.greyLight, width: 2),
        gapPadding: 5,
      ),
    ),
    // BUTTONS
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          fixedSize:
              MaterialStateProperty.all(const Size(double.maxFinite, 50)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          foregroundColor: MaterialStateProperty.all(AppColor.greenDark),
          backgroundColor: MaterialStateProperty.all(AppColor.greenLight),
          textStyle: MaterialStateProperty.all(
              const TextStyle(fontWeight: FontWeight.w700, fontSize: 17))),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(AppColor.grey),
      overlayColor: MaterialStateProperty.all(AppColor.greenLight)
    )));
