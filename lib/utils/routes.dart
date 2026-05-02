import 'package:day2/pages/home_screen.dart';
import 'package:day2/pages/login_screen.dart';
import 'package:day2/utils/route_name.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Text("No Page Route For this Page")),
        );
    }
  }
}
