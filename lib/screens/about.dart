import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hba114_github_io_website/components/app_bar.dart';
import 'package:hba114_github_io_website/components/background.dart';

class About extends StatefulWidget {
  static String routeName = "/about";
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // ignore: prefer_interpolation_to_compose_strings
    String aboutText = "      Hi I'm Hasan Basri Ayhaner. I'm a Computer Engineering student." +
        " I am using Flutter for creating Android, Desktop and Web applications." +
        " I made my first web project with flutter and this web application is built with flutter too." +
        " Now i am working on graduation project with ASP.NET and ReactJS. I am developing an" +
        " E-Commerce Web Application with Prediction algorithms such as Appriori algorithm from Association Rules." +
        " I'm also a Python developer and Python is my favorite programming language.";

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
                "About Me",
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
                aboutText,
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
}
