import 'package:flutter/material.dart';
import 'package:hba114_github_io_website/screens/about.dart';
import 'package:hba114_github_io_website/screens/home.dart';
import 'package:hba114_github_io_website/screens/socials.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  String lang = "en";

  // ignore: todo
  // TODO: Use notifier for language setting and create button for language swapping.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hasan Basri Ayhaner',
      theme: ThemeData.dark(),
      routes: {
        Home.routeName: (BuildContext context) => Home(lang),
        About.routeName: (BuildContext context) => About(lang),
        Socials.routeName: (BuildContext context) => Socials(lang)
      },
      initialRoute: Home.routeName,
    );
  }
}
