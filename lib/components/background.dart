import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  late Size size;
  late Widget child;

  Background(this.size, this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     opacity: 0.05,
      //     image: AssetImage("assets/images/matrix.jpg"),
      //     fit: BoxFit.fill,
      //   ),
      // ),
      child: child,
    );
  }
}
