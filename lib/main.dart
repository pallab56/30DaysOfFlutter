import 'package:day2/utils/route_name.dart';
import 'package:day2/widgets/themes.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:MyThemes.lightTheme(context),
      darkTheme:MyThemes.darkTheme(context), 

      initialRoute: RouteName.homeScreen,
      onGenerateRoute: Routes.generateRoute,
      //home: HomeScreen(),
    );
  }
}



