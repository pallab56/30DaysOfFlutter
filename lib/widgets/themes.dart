import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:velocity_x/velocity_x.dart";

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
    fontFamily: GoogleFonts.lato().fontFamily,
    cardColor: Colors.white,
    canvasColor: creamColor,
    primaryColor: Colors.black,

    buttonTheme: ButtonThemeData(buttonColor: darkBluishColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkBluishColor,
    ),

    appBarTheme: AppBarThemeData(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      elevation: 0.0,
    ),
    textTheme: Theme.of(context).textTheme,
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
   
    fontFamily: GoogleFonts.lato().fontFamily,
    cardColor: Colors.black,
    canvasColor: darkCreamColor,
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: lightBluishColor,
    // ),
    buttonTheme: ButtonThemeData(
      
      buttonColor: lightBluishColor
      
      ),
    appBarTheme: AppBarThemeData(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      elevation: 0.0,
    ),
    primaryColor: Colors.white,
    textTheme: Theme.of(context).textTheme,
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}
