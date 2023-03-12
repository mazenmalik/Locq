import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:locq/resources/functions.dart';
import 'package:locq/widgets/locq_widgets.dart';
import 'package:locq/view%20model/station_viewmodel.dart';

Object? val;

class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    final stationViewModel = Provider.of<StationListViewModel>(context);
    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: stationViewModel.station.data!.stations!.length,
          itemBuilder: (context, index) {
            final name =
                stationViewModel.station.data!.stations![index].name.toString();
            final latitude =
                stationViewModel.station.data!.stations![index].latitude;
            final longitude =
                stationViewModel.station.data!.stations![index].longitude;
            return InkWell(
              onTap: () => setState((() => val = index)),
              child: StationListTile(
                  val: val,
                  name: name,
                  latitude: checkDouble(latitude),
                  longitude: checkDouble(longitude),
                  index: index,
                  onChanged: (value) => setState(() => val = value)),
            );
          },
        ),
      ),
    );
  }
}
