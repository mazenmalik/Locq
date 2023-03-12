import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:locq/resources/app_string.dart';

class SlotMachineWithoutLever extends StatelessWidget {
  const SlotMachineWithoutLever({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 38,
          ),
          SvgPicture.asset(
            AppString.slotMachineWithoutLever,
            width: 330,
          ),
        ],
      ),
    );
  }
}
