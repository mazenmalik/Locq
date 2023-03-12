import 'package:flutter/material.dart';
import 'package:locq/resources/app_string.dart';

class AnimatedConfetti extends StatelessWidget {
  const AnimatedConfetti({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 170,
        left: 0,
        right: 0,
        child: Image.asset(AppString.animatedConfetti));
  }
}
