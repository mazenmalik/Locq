import 'selected_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:locq/resources/functions.dart';
import 'package:locq/view%20model/station_viewmodel.dart';
import 'package:locq/view/search%20screen/widgets/search_list.dart';

class SelectedStationModal extends StatelessWidget {
  const SelectedStationModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stationViewModel =
        Provider.of<StationListViewModel>(context, listen: false);
    String? time;
    final opensAt = stationViewModel.station.data!.stations![val].opensAt;
    final closesAt = stationViewModel.station.data!.stations![val].closesAt;
    if (opensAt == "00:00:00" && closesAt == "23:59:59" ||
        opensAt == closesAt) {
      time = '24 hours';
    } else {
      time = '${toTime(opensAt)} - ${toTime(closesAt)}';
    }

    return Positioned(
        bottom: 20,
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          height: 230,
          width: double.maxFinite,
          child: SeletedDetails(stationViewModel: stationViewModel, time: time),
        ));
  }
}
