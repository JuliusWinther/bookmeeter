import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        // Define the default brightness and colors.
        brightness: Brightness.light,
        //primaryColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 251, 250, 245),
        scaffoldBackgroundColor:
            Colors.white, //const Color.fromARGB(255, 251, 250, 245),
        //secondaryHeaderColor: const Color.fromARGB(255, 65, 65, 65),

        // Define the default font family.
        fontFamily: GoogleFonts.balooTamma2().fontFamily,

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color.fromARGB(255, 0, 5, 26),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            color: Color.fromARGB(255, 89, 89, 89),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          headline5: TextStyle(
            color: Color.fromARGB(255, 144, 141, 142),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          headline6: TextStyle(
            color: Color.fromARGB(255, 169, 169, 169),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          subtitle1: TextStyle(
            color: Color.fromARGB(255, 0, 5, 26),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        /*drawerTheme: const DrawerThemeData(
          backgroundColor: Color.fromARGB(255, 251, 250, 245),
        ),*/
        /*floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 251, 250, 245),
          hoverColor: Colors.white,
          splashColor: Color.fromARGB(150, 160, 160, 160),
          foregroundColor: Color.fromARGB(255, 0, 5, 26),
        ),*/
        /*iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 251, 250, 245),
        ),*/
        //cardColor: const Color.fromARGB(255, 251, 250, 245),
        //canvasColor: const Color.fromARGB(255, 251, 250, 245),
        /*tooltipTheme: TooltipThemeData(
            textStyle: const TextStyle(
                fontSize: 13, fontWeight: FontWeight.w200, color: Colors.white),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 65, 65, 65),
                borderRadius: BorderRadius.circular(8))),*/
      );

  static ThemeData get dark => ThemeData(
      useMaterial3: true,
      // Define the default brightness and colors.
      brightness: Brightness.light,
      //primaryColor: Colors.black,
      backgroundColor: const Color.fromARGB(255, 251, 250, 245),
      scaffoldBackgroundColor:
          Colors.white, //const Color.fromARGB(255, 251, 250, 245),
      //secondaryHeaderColor: const Color.fromARGB(255, 65, 65, 65),

      // Define the default font family.
      fontFamily: GoogleFonts.balooTamma2().fontFamily,

      // Define the default `TextTheme`. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: Color.fromARGB(255, 0, 5, 26),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          color: Color.fromARGB(255, 89, 89, 89),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        headline5: TextStyle(
          color: Color.fromARGB(255, 144, 141, 142),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        headline6: TextStyle(
          color: Color.fromARGB(255, 169, 169, 169),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        subtitle1: TextStyle(
          color: Color.fromARGB(255, 0, 5, 26),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ));
}
