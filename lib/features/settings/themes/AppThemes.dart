import 'package:rent_ready_app/utilities/colors/dark_colors.dart';
import 'package:rent_ready_app/utilities/colors/light_colors.dart';
import 'package:flutter/material.dart';


ThemeData getLightTheme(String fontFamily) => ThemeData(
    brightness: Brightness.light,
    accentColor: lightAccentColor,
    backgroundColor: lightBackgroundColor,
    errorColor: lightErrorTextColor,
    cursorColor: lightSubtitleTextColor,
    scaffoldBackgroundColor: lightBackgroundColor,
    splashColor: lightCardViewColor,
    primaryColor: lightAccentColor,



    toggleableActiveColor: lightCorrectTextColor,
    dividerColor: lightDividerColor,

    iconTheme: const IconThemeData(
        color: lightIconsColors
    ),
//    colorScheme: const ColorScheme.light().copyWith(primary: lightAccentColor),
    appBarTheme: const AppBarTheme(
      color: lightBackgroundColor,
      elevation: 0,
      brightness: Brightness.light,
    ),
    unselectedWidgetColor: lightDisabledButtonBackgroundColor,
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: lightDialogsBackgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)))),
    chipTheme: ChipThemeData.fromDefaults(
        secondaryColor: lightCardViewColor,
        primaryColor: lightAccentColor,
        labelStyle:
        const TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
    cardTheme: CardTheme(
        elevation: 8,
        color: lightCardViewColor,
        shadowColor: const Color(0xffF7F7F7).withOpacity(.5),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)))),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: lightHintTextColor,
        fontSize: 16,
      ),
      helperStyle: TextStyle(
        color: lightHintTextColor,
        fontSize: 12,
      ),
      hintStyle: TextStyle(
        color: darkHintTextColor,
        fontSize: 16,
      ),
      errorStyle: TextStyle(
        color: lightErrorTextColor,
        fontSize: 16,
      ),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
          color: lightHeaderTextColor,
          fontSize: 28,
         
          fontWeight: FontWeight.bold),
      headline3: TextStyle(
          color: lightHeaderTextColor,
          fontSize: 24,
         
          fontWeight: FontWeight.bold),
      subtitle1: TextStyle(
          color: lightSubtitleTextColor,
          fontSize: 14,
          fontWeight: FontWeight.normal),
      bodyText1: TextStyle(
          color: lightBodyTextColor,
          fontSize: 16,
         
          fontWeight: FontWeight.normal),

      /*
        this style to use it like title style but the different here use this onDarkBackground like intro page
         */
      headline2: TextStyle(
          color: lightHeaderTextColor,
          fontSize: 26,
         
          fontWeight: FontWeight.bold),
      headline4: TextStyle(
          color: lightHeaderTextColor,
          fontSize: 20,
         
          fontWeight: FontWeight.bold),
      headline5: TextStyle(
          color: lightHeaderTextColor,
          fontSize: 14,
         
          fontWeight: FontWeight.bold),
      caption: TextStyle(
          color: lightAccentColor, fontSize: 14, fontWeight: FontWeight.normal),
      /*
        this style to use it like subtitle style but the different here use this onDarkBackground like skip text in intro page
         */
      subtitle2: TextStyle(
          color: lightSubtitleTextColor,
          fontSize: 14,
          fontWeight: FontWeight.bold),
      /*
        this style to use it like body style but the different here use this onLightBackground like text in intro page
         */
      bodyText2: TextStyle(
          color: lightHeaderTextColor,
          fontSize: 14,
          fontWeight: FontWeight.normal),
    ),
    fontFamily: fontFamily);

ThemeData getDarkTheme(String fontFamily) => ThemeData(
    brightness: Brightness.dark,
    accentColor: darkAccentColor,
    backgroundColor: darkBackgroundColor,
    cursorColor: darkHeaderTextColor,
    errorColor: darkErrorTextColor,
    splashColor: darkCardViewColor,
    primaryColor: darkAccentColor,

    toggleableActiveColor: lightCorrectTextColor,
    dividerColor: darkDividerColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    iconTheme: const IconThemeData(
      color: darkIconsColors,

    ),
    appBarTheme: const AppBarTheme(
        color: darkBackgroundColor,
        elevation: 0
    ),
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: darkDialogsBackgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)))),
    chipTheme: ChipThemeData.fromDefaults(
        secondaryColor: darkCardViewColor,
        primaryColor: darkAccentColor,
        labelStyle:
        const TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
    cardTheme: const CardTheme(
        elevation: 8,
        shadowColor: Colors.transparent,
        color: darkCardViewColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)))),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: darkHintTextColor,
        fontSize: 16,
      ),
      helperStyle: TextStyle(
        color: darkHintTextColor,
        fontSize: 12,
      ),
      hintStyle: TextStyle(
        color: darkHintTextColor,
        fontSize: 16,
      ),
      errorStyle: TextStyle(
        color: darkErrorTextColor,
        fontSize: 16,
      ),
    ),
    textTheme: const TextTheme(
        caption: TextStyle(
            color: darkAccentColor,
            fontSize: 14,
            fontWeight: FontWeight.normal),
        headline1: TextStyle(
            color: darkHeaderTextColor,
            fontSize: 28,
           
            fontWeight: FontWeight.bold),
        headline3: TextStyle(
            color: darkHeaderTextColor,
            fontSize: 24,
           
            fontWeight: FontWeight.bold),
        subtitle1: TextStyle(
            color: darkSubtitleTextColor,
            fontSize: 14,
            fontWeight: FontWeight.normal),
        bodyText1: TextStyle(
            color: darkBodyTextColor,
            fontSize: 16,
           
            fontWeight: FontWeight.normal),
        /*
        this style to use it like title style but the different here use this onDarkBackground like intro page
         */
        headline2: TextStyle(
            color: darkHeaderTextColor,
            fontSize: 26,
           
            fontWeight: FontWeight.bold),
        headline4: TextStyle(
            color: darkHeaderTextColor,
            fontSize: 20,
           
            fontWeight: FontWeight.bold),
        headline5: TextStyle(
            color: darkHeaderTextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold),
        /*
        this style to use it like subtitle style but the different here use this onDarkBackground like skip text in intro page
         */
        subtitle2: TextStyle(
            color: darkSubtitleTextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold),
        /*
        this style to use it like body style but the different here use this onLigthBackground like text in intro page
         */
        bodyText2: TextStyle(
            color: darkBodyTextColor,
            fontSize: 14,
            fontWeight: FontWeight.normal)),
    fontFamily: fontFamily);
