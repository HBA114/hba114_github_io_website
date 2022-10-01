import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hba114_github_io_website/components/app_bar.dart';
import 'package:hba114_github_io_website/components/background.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String helloText = "Merhaba, ben Hasan Basri Ayhaner.";
    String homeText =
        "        Konya Teknik Üniversitesi Bilgisayar Mühendisliği 4. sınıf öğrencisiyim. ASP.NET Core teknolojisini kullanarak, katmanlı mimari yaklaşımı ile projeler geliştiriyorum." +
            "Yapay Zeka ve backend konularına ilgim var. Aynı zamanda kendimi Java Spring Boot üzerinde geliştirmeye devam ediyorum." +
            "BTK Akademi, Udemy, YouTube vb. platformlar aracılığı ile yeni teknolojileri sürekli takip ediyor, daha önce öğrendiklerimi geliştiriyorum." +
            "";

    String helloTextEn = "Hello, I'm Hasan Basri Ayhaner.";
    String homeTextEn = "        I'm student at Konya Technical University 4th grade. " +
        "I'm developing ASP.NET Core backend applications using Layered Architecture. " +
        "I'm interested with Artificial Intelligence and Backend projects. Also i'm learning Java Spring Boot applications. " +
        "I'm using BTK Academy, Udemy, YouTube platforms etc. for learning and tracking technologies. " +
        "Check out About page for more information or Socials page for more details about projects and" +
        " my social media.";

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
                helloTextEn,
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
                homeTextEn,
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
}
