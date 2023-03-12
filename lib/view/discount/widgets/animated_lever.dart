import 'package:flutter/material.dart';
import 'package:locq/resources/app_string.dart';

class AnimatedLever extends StatelessWidget {
  const AnimatedLever({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 199,
      left: 28,
      right: 0,
      child: Container(
        height: 490,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(AppString.animatedLever),
          ),
        ),
      ),
    );
  }
}
