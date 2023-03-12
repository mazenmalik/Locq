import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:locq/widgets/locq_widgets.dart';
import 'package:locq/resources/app_string.dart';

class DailyDicount extends StatelessWidget {
  const DailyDicount({Key? key, required this.discount}) : super(key: key);
  final String discount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Stack(children: [
          Center(child: SvgPicture.asset(AppString.discountModal)),
          Positioned(
            left: 124,
            top: 240,
            child: Column(
              children: [
                Text(AppString.youGot, style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Row(children: [
                  LOCQTextWidget(
                      text: '₱ $discount / L',
                      fontSize: 27,
                      color: Color(0xff733bbd),
                      fontWeight: FontWeight.bold),
                  SizedBox(width: 15),
                  Text(AppString.off, style: TextStyle(fontSize: 20)),
                ]),
                SizedBox(height: 15),
                Text(AppString.onFuelProducts, style: TextStyle(fontSize: 20)),
                SizedBox(height: 105),
                LOCQTextWidget(
                  text: AppString.offerExpires,
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ],
            ),
          ),
        ]),
        SizedBox(height: 40),
        LOCQButtonWidget(
            text: AppString.buyFuelNow,
            radius: 30,
            width: MediaQuery.of(context).size.width / 1.57),
        SizedBox(height: 90),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.cancel_outlined,
              color: Colors.white,
              size: 32,
            ))
      ]),
    );
  }
}
