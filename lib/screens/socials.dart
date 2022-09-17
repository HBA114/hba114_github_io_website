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
                  color: Colors.red,
                  fontSize: 20,
                ),
                // style: TextStyle(
                //   fontSize: 20,
                //   color: Colors.white,
                // ),
              ),
            ),
            //
            //

            //! Button for social
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () async {
                  await launchUrl(Uri.parse("https://github.com/hba114"));
                },
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
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
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://avatars.githubusercontent.com/u/55455410?v=4"),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "Github",
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
            )
          ],
        ),
      ),
    );
  }
}
