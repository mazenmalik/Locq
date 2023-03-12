import 'package:flutter/material.dart';
import 'package:locq/view/search%20screen/search_screen.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.search, color: Colors.white),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SearchScreen()));
        });
  }
}
