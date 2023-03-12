import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:locq/resources/app_string.dart';

class Confetti extends StatelessWidget {
  const Confetti({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 260,
      left: 65,
      child: SvgPicture.asset(AppString.confetti, width: 300),
    );
  }
}
