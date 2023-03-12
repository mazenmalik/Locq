import 'widgets/selected_map.dart';
import 'package:flutter/material.dart';
import 'widgets/seleted_station_modal.dart';
import 'package:locq/widgets/locq_widgets.dart';
import 'package:locq/view/landing%20screen/widgets/search_button.dart';

class SelectedStationScreen extends StatelessWidget {
  const SelectedStationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[SearchButton()],
        automaticallyImplyLeading: false,
        title: SearchStationText(),
        toolbarHeight: 100,
        backgroundColor: Color(0xff733bbd),
      ),
      body: Stack(
        children: const [SelectedMap(), SelectedStationModal(), BottomBar()],
      ),
    );
  }
}
