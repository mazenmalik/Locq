import 'widgets/search_button.dart';
import 'widgets/nearby_stations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:locq/data/response/status.dart';
import 'package:locq/Widgets/locq_widgets.dart';
import 'package:locq/view%20model/station_viewmodel.dart';
import 'package:locq/view/landing%20screen/widgets/google_map.dart';
import 'package:locq/view/search%20screen/widgets/which_price_station.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);
  @override
  State<LandingScreen> createState() => _MapsState();
}

class _MapsState extends State<LandingScreen> {
  StationListViewModel stationListViewModel = StationListViewModel();
  @override
  void initState() {
    stationListViewModel.getCurrentPosition(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StationListViewModel>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
            bottom: AppBar(
                title: WhichPriceLOCQstation(),
                backgroundColor: Color(0xff733bbd),
                automaticallyImplyLeading: false),
            actions: const <Widget>[SearchButton()],
            automaticallyImplyLeading: false,
            title: SearchStationText(),
            toolbarHeight: 60,
            backgroundColor: Color(0xff733bbd)),
        body: ChangeNotifierProvider<StationListViewModel>(
            create: (BuildContext context) => stationListViewModel,
            child: Consumer<StationListViewModel>(builder: (context, value, _) {
              switch (value.stationList.status!) {
                case Status.LOADING:
                  return Center(
                      child: Center(child: CircularProgressIndicator()));
                case Status.ERROR:
                  return Center(
                      child: Text(value.stationList.message.toString()));
                case Status.COMPLETED:
                  provider.loadStationList(value.stationList.data);
                  return Builder(builder: (context) {
                    return Stack(children: [
                      GoogleMaps(),
                      NearByStations(value: value),
                      BottomBar()
                    ]);
                  });
              }
            })));
  }
}
