import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hba114_github_io_website/components/app_bar.dart';
import 'package:hba114_github_io_website/components/background.dart';
import 'package:hba114_github_io_website/components/custom_drawer.dart';

import 'package:url_launcher/url_launcher.dart';

class Socials extends StatefulWidget {
  static String routeName = "/socials";
  late final ValueNotifier<String> notifier;
  Socials(this.notifier, {super.key});

  @override
  State<Socials> createState() => _SocialsState(notifier);
}

class _SocialsState extends State<Socials> {
  String header = "";
  String githubInfo = "";
  String linkedInInfo = "";
  String lang = "en";
  late final ValueNotifier<String> notifier;
  _SocialsState(this.notifier);

  @override
  void initState() {
    super.initState();
    GetTexts();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isMobile = size.width <= 650;
    notifier.addListener(() async {
      await GetTexts();
    });

    return Scaffold(
      endDrawer: CustomDrawer(notifier),
      body: Background(
        size,
        SingleChildScrollView(
          child: Column(
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
                  //! use google fonts for better look
                  style: GoogleFonts.robotoMono(
                    color: Colors.white,
                    fontSize: isMobile ? 16 : 20,
                  ),
                ),
              ),

              //! Button for social
              SocialButtonWithInfo(
                "Github",
                "https://github.com/HBA114",
                "https://raw.githubusercontent.com/HBA114/hba114.github.io/main/assets/assets/images/github.png",
                githubInfo,
                isMobile,
              ),

              SocialButtonWithInfo(
                "LinkedIn",
                "https://www.linkedin.com/in/hasan-basri-ayhaner-hba114/",
                "https://raw.githubusercontent.com/HBA114/hba114.github.io/main/assets/assets/images/linkedin.png",
                linkedInInfo,
                isMobile,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SocialButtonWithInfo(String socialName, String link, String imageLink,
      String infoText, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SocialButton(
                socialName, link, imageLink, NetworkImage(imageLink), isMobile),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: SelectableText(
            infoText,
            style: GoogleFonts.robotoMono(
              fontSize: isMobile ? 12 : 16,
            ),
          ),
        ),
      ],
    );
  }

  SocialButton(String socialName, String link, String imageLink,
      ImageProvider image, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () async {
          await launchUrl(Uri.parse(link));
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(20)),
          child: Center(
            heightFactor: 1,
            widthFactor: 1,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CircleAvatar(
                    radius: 30,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: image,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    socialName,
                    style: GoogleFonts.robotoMono(
                      color: Colors.white,
                      fontSize: isMobile ? 18 : 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> GetTexts() async {
    final String response =
        await rootBundle.loadString("assets/language/page_texts.json");
    // print(response);
    final data = jsonDecode(response);
    header = data["SocialsTexts"]["Header"][notifier.value];
    githubInfo = data["SocialsTexts"]["GithubText"][notifier.value];
    linkedInInfo = data["SocialsTexts"]["LinkedInText"][notifier.value];
    setState(() {});
  }
}
