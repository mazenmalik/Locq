import 'package:flutter/material.dart';
import 'package:locq/resources/functions.dart';
import 'package:locq/Widgets/locq_widgets.dart';
import 'package:locq/resources/app_string.dart';
import 'package:locq/view/discount/locq_spin.dart';
import 'package:locq/view%20model/station_viewmodel.dart';
import 'package:locq/view/search%20screen/widgets/search_list.dart';

class SeletedDetails extends StatelessWidget {
  const SeletedDetails({
    Key? key,
    required this.stationViewModel,
    required this.time,
  }) : super(key: key);
  final StationListViewModel stationViewModel;
  final String? time;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CustomTextButton(
            name: AppString.backToList,
            onPressed: () => Navigator.of(context).pop()),
        CustomTextButton(
            name: AppString.done,
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LocqSpin()))),
      ]),
      SizedBox(height: 20),
      LOCQTextWidget(
          text: stationViewModel.station.data!.stations![val].name,
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.bold),
      LOCQTextWidget(
          text: stationViewModel.station.data!.stations![val].address,
          fontSize: 13.0,
          color: Colors.black,
          fontWeight: FontWeight.normal),
      LOCQTextWidget(
          text:
              '${stationViewModel.station.data!.stations![val].city}, ${stationViewModel.station.data!.stations![val].province}',
          fontSize: 13.0,
          color: Colors.black,
          fontWeight: FontWeight.normal),
      SizedBox(height: 25),
      Row(
        children: [
          Icon(Icons.directions_car_outlined, color: Color(0xff3e5079)),
          Text(
              '  ${distance(stationViewModel.station.data!.stations![val].latitude, stationViewModel.station.data!.stations![val].longitude, currentPosition!.latitude, currentPosition!.longitude).toStringAsFixed(0)} km away'),
          SizedBox(width: 20),
          Icon(Icons.access_time, color: Color(0xff3e5079)),
          Text('  Open $time')
        ],
      ),
    ]);
  }
}
