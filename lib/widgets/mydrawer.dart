import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.teal,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            accountName: Text(
              "Pallab Chandra Das",
              // textScaleFactor: 1,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: "GoogleFonts.lato()",
              ),
            ),
            accountEmail: Text(
              "pallab15-5698@diu.edu.bd",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: "GoogleFonts.lato()",
              ),
            ),

            currentAccountPicture: CircleAvatar(
              minRadius: 50,
              backgroundImage: AssetImage("assets/images/photo.jpg"),
            ),
          ),
          // SizedBox(child: VerticalDivider(width: 3, thickness: 2)),
          ListTile(
            leading: Icon(Icons.home_outlined, color: Colors.white, size: 32),
            title: Text(
              "Home",
              style: TextStyle(fontSize: 24, color: Colors.white60),
            ),
            // titleTextStyle: TextStyle(overflow: TextOverflow.clip),
            trailing: Icon(
              Icons.remove_outlined,
              color: Colors.white,
              size: 24,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle_sharp,
              color: Colors.white,
              size: 32,
            ),
            title: Text(
              "Profile",
              style: TextStyle(fontSize: 24, color: Colors.white60),
            ),
            // titleTextStyle: TextStyle(overflow: TextOverflow.clip),
            trailing: Icon(
              Icons.remove_outlined,
              color: Colors.white,
              size: 24,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings_outlined,
              color: Colors.white,
              size: 32,
            ),
            title: Text(
              "Settings",
              style: TextStyle(fontSize: 24, color: Colors.white60),
            ),
            // titleTextStyle: TextStyle(overflow: TextOverflow.clip),
            trailing: Icon(
              Icons.remove_outlined,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
