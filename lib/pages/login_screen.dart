import 'package:day2/utils/route_name.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
     if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed((context), RouteName.homeScreen);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(
              "$name Welcome To Our Page",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Form(
                key: _formkey,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "User Name Cannot Be Empty";
                        }
                        return null;
                      },

                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
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
                       validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "password Cannot Be Empty";
                        }
                        else if ( value.length<6) {
                          return "password length should Be at-least 6";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 5),
                    Material(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepPurple,
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          alignment: Alignment.center,
                          height: 40,
                          width: changeButton ? 80 : 150,

                          // decoration: BoxDecoration(
                          //   color: Colors.deepPurple,
                          //   shape: changeButton
                          //       ? BoxShape.circle
                          //       : BoxShape.rectangle,
                          // ),
                          child: changeButton
                              ? Icon(
                                  Icons.done_outlined,
                                  color: Colors.white,
                                  size: 24,
                                )
                              : Text(
                                  "LogIn",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: "GoogleFonts.lato()",
                                  ),
                                ),
                        ),
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, RouteName.homeScreen);
                    //   },
                    //   style: TextButton.styleFrom(
                    //     minimumSize: Size(150, 40),
                    //     backgroundColor: Colors.purple[400],
                    //   ),
                    //   child: Text(
                    //     "Log In",
                    //     style: TextStyle(color: Colors.black),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
