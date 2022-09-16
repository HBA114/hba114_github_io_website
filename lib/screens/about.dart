import 'package:flutter/material.dart';
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

    return Scaffold(
      body: Background(
        size,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            CustomAppBar(),
            const SizedBox(height: 20),
            //
            // ! Hello Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                "About",
                style: const TextStyle(
                  fontSize: 20,
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
