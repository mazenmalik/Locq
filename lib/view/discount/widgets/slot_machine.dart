import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locq/resources/app_string.dart';

class SlotMachine extends StatelessWidget {
  const SlotMachine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset(AppString.slotMachine, width: 348));
  }
}
