import 'package:flutter/material.dart';
import 'package:hba114_github_io_website/screens/about.dart';
import 'package:hba114_github_io_website/screens/home.dart';
import 'package:hba114_github_io_website/screens/socials.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hasan Basri Ayhaner',
      theme: ThemeData.dark(),
      routes: {
        Home.routeName: (BuildContext context) => new Home(),
        About.routeName: (BuildContext context) => new About(),
        Socials.routeName: (BuildContext context) => new Socials()
      },
      initialRoute: Home.routeName,
    );
  }
}
