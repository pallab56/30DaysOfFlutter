import 'package:day2/widgets/mydrawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("HomeScreen"))),
      drawer: Mydrawer(),
      body: Center(
        child: Container(
          child: Text(
            "Welcome To HomeScreen",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: "GoogleFonts.abel()",
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}
