import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:locq/resources/app_string.dart';

class SpinButton extends StatelessWidget {
  const SpinButton({Key? key, required this.onTap}) : super(key: key);
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 130,
      bottom: 333,
      child: InkWell(
        onTap: onTap,
        child: SvgPicture.asset(AppString.spinButton, width: 190),
      ),
    );
  }
}
