import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hba114_github_io_website/components/app_bar.dart';
import 'package:hba114_github_io_website/components/background.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";
  String lang;
  Home(this.lang, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<Home> createState() => _HomeState(lang);
}

class _HomeState extends State<Home> {
  late String response;
  late dynamic data;
  String hello = "";
  String home = "";
  String lang = "en";

  _HomeState(this.lang);
  @override
  void initState() {
    super.initState();
    ReadHomeTexts();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        size,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const CustomAppBar(),
            const SizedBox(height: 20),
            //
            // ! Hello Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                hello,
                style: GoogleFonts.robotoMono(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            //
            // ! HomeText
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                home,
                style: GoogleFonts.robotoMono(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> ReadHomeTexts() async {
    response = await rootBundle.loadString("../lib/language/page_texts.json");
    // print(response);
    data = jsonDecode(response);
    hello = data["HomeTexts"]["Hello"][lang];
    home = data["HomeTexts"]["Home"][lang];
    setState(() {});
  }
}
