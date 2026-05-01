import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
            Text(
              "Welcome To Our Page",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                spacing: 20,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter UserName",
                      labelText: "UserName",
                      labelStyle: TextStyle(fontSize: 18),
                      // helperText: "Must be fullfilled",
                      helperStyle: TextStyle(
                        decoration: TextDecoration.combine([
                          TextDecoration.underline,
                        ]),
                        color: Colors.redAccent,
                      ),

                      // filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "PassWord",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          width: 5.0,
                          style: BorderStyle.solid,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      print("Log In");
                    },
                    style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(
                        Colors.amberAccent,
                        
                      ),
                    ),
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
