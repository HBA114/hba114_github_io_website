import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hba114_github_io_website/components/app_bar.dart';
import 'package:hba114_github_io_website/components/background.dart';
import 'package:hba114_github_io_website/components/custom_drawer.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";
  final ValueNotifier<String> notifier;
  const Home(this.notifier, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<Home> createState() => _HomeState(notifier);
}

class _HomeState extends State<Home> {
  late String response;
  late dynamic data;
  String hello = "";
  String home = "";
  late final ValueNotifier<String> notifier;
  int fontSize = 18;

  _HomeState(this.notifier);

  @override
  void initState() {
    super.initState();
    readHomeTexts();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isMobile = size.width <= 650;
    notifier.addListener(() async {
      await readHomeTexts();
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
                  hello,
                  style: GoogleFonts.robotoMono(
                    fontSize: isMobile ? 16 : 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //
              // ! HomeText
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 30 : 60),
                child: SelectableText(
                  home,
                  style: GoogleFonts.robotoMono(
                    fontSize: isMobile ? 14 : 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> readHomeTexts() async {
    response = await rootBundle.loadString("assets/language/page_texts.json");
    // print(response);
    data = jsonDecode(response);
    hello = data["HomeTexts"]["Hello"][notifier.value];
    home = data["HomeTexts"]["Home"][notifier.value];
    setState(() {});
  }
}
