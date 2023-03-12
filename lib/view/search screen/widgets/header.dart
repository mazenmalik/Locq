import 'package:flutter/material.dart';
import 'package:locq/Widgets/locq_widgets.dart';
import 'package:locq/view/search%20screen/widgets/search_list.dart';
import 'package:locq/view/selected%20station%20screen/seleted_station_screen.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 70, left: 10, right: 10, bottom: 25),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 32, right: 10),
                child: SearchStationText(),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                if (val == null || val == '') {
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SelectedStationScreen()));
                }
              },
            )
          ],
        ));
  }
}
