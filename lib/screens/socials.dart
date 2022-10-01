import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hba114_github_io_website/components/app_bar.dart';
import 'package:hba114_github_io_website/components/background.dart';

import 'package:url_launcher/url_launcher.dart';

class Socials extends StatefulWidget {
  static String routeName = "/socials";
  const Socials({super.key});

  @override
  State<Socials> createState() => _SocialsState();
}

class _SocialsState extends State<Socials> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        size,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const CustomAppBar(),
            const SizedBox(height: 20),
            //
            // ! Hello Text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                "Socials",
                //! use google fonts for better look
                style: GoogleFonts.robotoMono(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),

            //! Button for social
            SocialButtonWithInfo(
              "Github",
              "https://github.com/HBA114",
              "https://avatars.githubusercontent.com/u/55455410?v=4",
              "You can follow my work from github.",
            ),

            SocialButtonWithInfo(
              "LinkedIn",
              "https://www.linkedin.com/in/hasan-basri-ayhaner-9b2452228/",
              "https://media-exp1.licdn.com/dms/image/C4D03AQERq6NQ_vMeWw/profile-displayphoto-shrink_800_800/0/1651933832695?e=1669852800&v=beta&t=JfqlHrFTOME_QgPe_owUEYzC6t4mBr0iY6GiPa5krf0",
              "You can reach me via LinkedIn.",
            ),

            //! Email button should open e-mail app and create a mail to given address
            // SocialButtonWithInfo(
            //   "E-Mail",
            //   "hbasriayhaner114@gmail.com",
            //   "https://avatars.githubusercontent.com/u/55455410?v=4",
            //   "You can reach me via E-Mail.",
            // ),
          ],
        ),
      ),
    );
  }

  SocialButtonWithInfo(
      String socialName, String link, String imageLink, String infoText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SocialButton(
          socialName,
          link,
          imageLink,
        ),
        Text(
          infoText,
          style: GoogleFonts.robotoMono(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  SocialButton(String socialName, String link, String imageLink) {
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
                          image: NetworkImage(imageLink),
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
                      fontSize: 22,
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
}
