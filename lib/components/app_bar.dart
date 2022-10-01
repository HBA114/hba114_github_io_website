import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hba114_github_io_website/components/route_animations.dart';
import 'package:hba114_github_io_website/screens/about.dart';
import 'package:hba114_github_io_website/screens/home.dart';
import 'package:hba114_github_io_website/screens/socials.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String home = "";
  String about = "";
  String socials = "";
  String lang = "en";

  @override
  void initState() {
    super.initState();
    GetButtonNames();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, -2),
              blurRadius: 30,
              color: Colors.black.withOpacity(0.16)),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://avatars.githubusercontent.com/u/55455410?v=4"),
                ),
              ),
            ),
          ),
          //
          //
          const SizedBox(width: 10),
          TextButton(
            onPressed: () {
              print("Home");
              Navigator.pushReplacementNamed(context, Home.routeName);
              // Navigator.of(context).pushReplacement(new RouteHomeAnimation());
            },
            child: Text(
              home,
              style: GoogleFonts.robotoMono(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          //
          //
          const SizedBox(width: 10),
          TextButton(
            onPressed: () {
              print("About");
              Navigator.pushReplacementNamed(context, About.routeName);
              // Navigator.of(context).pushReplacement(new RouteAboutAnimation());
            },
            child: Text(
              about,
              style: GoogleFonts.robotoMono(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          const SizedBox(width: 10),
          //
          //
          TextButton(
            onPressed: () {
              print("Socials");
              Navigator.pushReplacementNamed(context, Socials.routeName);
              // Navigator.pushReplacement(context, RouteSocialsAnimation());
            },
            child: Text(
              socials,
              style: GoogleFonts.robotoMono(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Future<void> GetButtonNames() async {
    final response =
        await rootBundle.loadString("assets/language/buttons.json");
    final data = jsonDecode(response);
    setState(() {
      home = data["Buttons"]["Home"][lang];
      about = data["Buttons"]["About"][lang];
      socials = data["Buttons"]["Socials"][lang];
    });
  }
}
