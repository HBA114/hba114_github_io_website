import 'package:flutter/material.dart';
import 'package:hba114_github_io_website/screens/about.dart';
import 'package:hba114_github_io_website/screens/home.dart';
import 'package:hba114_github_io_website/screens/socials.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String lang = "en";

  final ValueNotifier<String> notifier = ValueNotifier("en");

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (_, mode, __) {
        return MaterialApp(
          title: 'Hasan Basri Ayhaner',
          theme: ThemeData.dark(),
          routes: {
            Home.routeName: (BuildContext context) => Home(notifier),
            About.routeName: (BuildContext context) => About(notifier),
            Socials.routeName: (BuildContext context) => Socials(notifier)
          },
          initialRoute: Home.routeName,
        );
      },
    );
  }
}
