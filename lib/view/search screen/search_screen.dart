import 'widgets/search_list.dart';
import 'widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:locq/view/search%20screen/widgets/header.dart';
import 'package:locq/view/search%20screen/widgets/which_price_station.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xff733bbd),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 280,
            child: Column(
              children: const [
                Header(),
                WhichPriceLOCQstation(),
                SearchTextField(),
              ],
            ),
          ),
          SearchList()
        ],
      ),
    ));
  }
}
