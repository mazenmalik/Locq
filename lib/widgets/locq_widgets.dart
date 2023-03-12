import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:locq/resources/functions.dart';
import 'package:locq/resources/app_string.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:locq/view%20model/spin_viewmodel.dart';
import 'package:locq/view%20model/station_viewmodel.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({Key? key, required this.onChanged}) : super(key: key);
  final void Function(PhoneNumber value) onChanged;
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
        autofocus: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        initialCountryCode: 'PH',
        onChanged: onChanged);
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required TextEditingController controller,
    required this.hintText,
    required this.obsecure,
    required this.onTap,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  final String hintText;
  final bool obsecure;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextField(
        autofocus: true,
        controller: _controller,
        obscureText: !obsecure,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF82736A))),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: InkWell(
            onTap: onTap,
            focusNode: FocusNode(skipTraversal: true),
            child: Icon(
              obsecure
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}

class SearchStationText extends StatelessWidget {
  const SearchStationText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppString.searchStation,
      style: TextStyle(color: Colors.white, fontSize: 20),
      textAlign: TextAlign.center,
    );
  }
}

class LOCQTextWidget extends StatelessWidget {
  const LOCQTextWidget(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.color,
      this.fontWeight = FontWeight.normal})
      : super(key: key);
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: color, fontSize: fontSize, fontWeight: fontWeight));
  }
}

class LOCQButtonWidget extends StatelessWidget {
  const LOCQButtonWidget(
      {Key? key, required this.radius, required this.width, required this.text})
      : super(key: key);
  final double radius, width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff733bbd),
          borderRadius: BorderRadius.circular(radius)),
      alignment: Alignment.center,
      width: width,
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(text,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}

class Numbers extends StatelessWidget {
  const Numbers({
    required this.left,
    Key? key,
  }) : super(key: key);

  final double left;

  @override
  Widget build(BuildContext context) {
    final spinViewModel = Provider.of<SpinViewModel>(context, listen: false);
    return Positioned(
        top: 400,
        left: left,
        child: ClipRect(
          child: Align(
            alignment: Alignment(2.0 * 115.0 / 512.0 - 1,
                spinViewModel.loading ? spinViewModel.random() : 0.39),
            heightFactor: .15,
            child: SvgPicture.asset(
              AppString.numbers,
              width: 40,
              clipBehavior: Clip.hardEdge,
            ),
          ),
        ));
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          color: Color(0xff733bbd),
          height: 20,
          width: 40,
        ));
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {Key? key, required this.onPressed, required this.name})
      : super(key: key);
  final Function() onPressed;
  final String name;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        onPressed: onPressed,
        child: LOCQTextWidget(
          color: Color(0xff4e98c4),
          text: name,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ));
  }
}

class StationListTile extends StatelessWidget {
  const StationListTile(
      {Key? key,
      required this.name,
      required this.latitude,
      required this.longitude,
      required this.index,
      required this.onChanged,
      required this.val})
      : super(key: key);

  final String name;
  final double latitude;
  final double longitude;
  final int index;
  final Object? val;
  final void Function(dynamic value) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(name),
        subtitle: Text(
            '${distance(latitude, longitude, currentPosition!.latitude, currentPosition!.longitude).toStringAsFixed(0)} km away from you'),
        trailing: Radio(
          value: index,
          groupValue: val,
          onChanged: onChanged,
        ));
  }
}
