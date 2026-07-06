import 'package:day2/utils/route_name.dart';
import 'package:day2/widgets/themes.dart';
import 'package:flutter/material.dart';
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
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),

      initialRoute: RouteName.cartScreen,
      onGenerateRoute: Routes.generateRoute,
      //home: HomeScreen(),
    );
  }
}
