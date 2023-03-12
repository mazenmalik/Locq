import 'list_of_nearby_stations.dart';
import 'package:flutter/material.dart';
import 'package:locq/resources/app_string.dart';
import 'package:locq/view%20model/station_viewmodel.dart';

class NearByStations extends StatelessWidget {
  const NearByStations({Key? key, required this.value}) : super(key: key);
  final StationListViewModel value;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 20,
        left: 0,
        right: 0,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          height: 300,
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppString.nearByStations),
                    Text(AppString.done)
                  ],
                ),
              ),
              ListOfNearByStations(value: value)
            ],
          ),
        ));
  }
}
