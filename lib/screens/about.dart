import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hba114_github_io_website/components/app_bar.dart';
import 'package:hba114_github_io_website/components/background.dart';
import 'package:hba114_github_io_website/components/custom_drawer.dart';

class About extends StatefulWidget {
  static String routeName = "/about";
  final ValueNotifier<String> notifier;
  const About(this.notifier, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<About> createState() => _AboutState(notifier);
}

class _AboutState extends State<About> {
  String header = "";
  String paragraph = "";
  String lang = "en";
  late final ValueNotifier<String> notifier;
  _AboutState(this.notifier);

  @override
  void initState() {
    super.initState();
    getTexts();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isMobile = size.width <= 650;
    notifier.addListener(() async {
      await getTexts();
    });

    return Scaffold(
      endDrawer: CustomDrawer(notifier),
      body: Background(
        size,
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomAppBar(notifier),
              const SizedBox(height: 20),
              //
              // ! Hello Text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 30 : 60),
                child: SelectableText(
                  header,
                  style: GoogleFonts.robotoMono(
                    fontSize: isMobile ? 16 : 20,
                    color: Colors.white,
                  ),
                ),
              ),

              ///
              const SizedBox(height: 20),
              // ! HomeText
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 30 : 60),
                child: SelectableText(
                  paragraph,
                  style: GoogleFonts.robotoMono(
                    fontSize: isMobile ? 14 : 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getTexts() async {
    final String response =
        await rootBundle.loadString("assets/language/page_texts.json");
    final data = jsonDecode(response);
    setState(() {
      header = data["AboutTexts"]["Header"][notifier.value];
      paragraph = data["AboutTexts"]["Paragraph"][notifier.value];
    });
  }
}
