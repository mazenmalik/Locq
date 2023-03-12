import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:locq/resources/app_string.dart';

class BackLight extends StatelessWidget {
  const BackLight({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 0,
        right: 0,
        top: 5,
        child: Center(child: SvgPicture.asset(AppString.backLight)));
  }
}
