import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hba114_github_io_website/screens/about.dart';
import 'package:hba114_github_io_website/screens/home.dart';
import 'package:hba114_github_io_website/screens/socials.dart';

class CustomDrawer extends StatefulWidget {
  final ValueNotifier<String> notifier;
  const CustomDrawer(this.notifier, {super.key});

  @override
  State<CustomDrawer> createState() =>
      // ignore: no_logic_in_create_state
      _CustomDrawerState(notifier);
}

class _CustomDrawerState extends State<CustomDrawer> {
  String home = "";
  String about = "";
  String socials = "";
  String lang = "en";
  late final ValueNotifier<String> notifier;

  _CustomDrawerState(this.notifier);

  @override
  void initState() {
    super.initState();
    getButtonNames();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Home.routeName);
            },
            child: Text(
              home,
              style: GoogleFonts.robotoMono(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              // print("About");
              Navigator.pushNamed(context, About.routeName);
            },
            child: Text(
              about,
              style: GoogleFonts.robotoMono(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              // print("Socials");
              Navigator.pushReplacementNamed(context, Socials.routeName);
            },
            child: Text(
              socials,
              style: GoogleFonts.robotoMono(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 23,
            child: Container(),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                notifier.value = notifier.value == "tr" ? "en" : "tr";
                getButtonNames();
              });
            },
            child: Text(
              notifier.value == "tr" ? "EN" : "TR",
              style: GoogleFonts.robotoMono(
                  fontSize: 19,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }

  Future<void> getButtonNames() async {
    final response =
        await rootBundle.loadString("assets/language/buttons.json");
    final data = jsonDecode(response);
    setState(() {
      home = data["Buttons"]["Home"][notifier.value];
      about = data["Buttons"]["About"][notifier.value];
      socials = data["Buttons"]["Socials"][notifier.value];
    });
  }
}
