import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hba114_github_io_website/components/app_bar.dart';
import 'package:hba114_github_io_website/components/background.dart';

class About extends StatefulWidget {
  static String routeName = "/about";
  String lang;
  About(this.lang, {super.key});

  @override
  State<About> createState() => _AboutState(lang);
}

class _AboutState extends State<About> {
  String header = "";
  String paragraph = "";
  String lang = "en";

  _AboutState(this.lang);

  @override
  void initState() {
    super.initState();
    GetTexts();
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
            CustomAppBar(),
            const SizedBox(height: 20),
            //
            // ! Hello Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                header,
                style: GoogleFonts.robotoMono(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),

            ///
            const SizedBox(height: 20),
            // ! HomeText
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                paragraph,
                style: GoogleFonts.robotoMono(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> GetTexts() async {
    final String response =
        await rootBundle.loadString("assets/language/page_texts.json");
    final data = jsonDecode(response);
    setState(() {
      header = data["AboutTexts"]["Header"][lang];
      paragraph = data["AboutTexts"]["Paragraph"][lang];
    });
  }
}
