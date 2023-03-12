import 'package:flutter/material.dart';
import 'package:locq/Widgets/locq_widgets.dart';
import 'package:locq/resources/app_string.dart';

class WhichPriceLOCQstation extends StatelessWidget {
  const WhichPriceLOCQstation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LOCQTextWidget(
          text: AppString.whichStation,
          fontSize: 13.7,
          color: Colors.white,
          fontWeight: FontWeight.bold),
    );
  }
}
