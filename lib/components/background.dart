import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Size size;
  final Widget child;

  const Background(this.size, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: child,
    );
  }
}
