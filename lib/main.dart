import 'package:day2/pages/login_screen.dart';
import 'package:day2/utils/route_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:day2/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      initialRoute: RouteName.loginScreen,
      onGenerateRoute: Routes.generateRoute,
      //home: HomeScreen(),
    );
  }
}
