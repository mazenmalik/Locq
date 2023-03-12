import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:locq/view%20model/station_viewmodel.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF82736A))),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onChanged: (value) {
          Provider.of<StationListViewModel>(context, listen: false)
              .changeSearchString(value);
        },
      ),
    );
  }
}
