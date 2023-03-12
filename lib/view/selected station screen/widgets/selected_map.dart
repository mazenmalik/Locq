import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:locq/resources/functions.dart';
import 'package:locq/view%20model/station_viewmodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locq/data/repository/station_list_repository.dart';
import 'package:locq/view/search%20screen/widgets/search_list.dart';
import 'package:locq/view/landing%20screen/widgets/google_map.dart';

class SelectedMap extends StatelessWidget {
  const SelectedMap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stationViewModel =
        Provider.of<StationListViewModel>(context, listen: false);
    final lat = stationViewModel.station.data!.stations![val].latitude;
    final long = stationViewModel.station.data!.stations![val].longitude;
    return Positioned.fill(
      child: GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(checkDouble(lat), checkDouble(long)), zoom: 14),
          mapType: MapType.normal,
          myLocationEnabled: true,
          padding: EdgeInsets.only(bottom: 250),
          onMapCreated: (controller) {
            googleMapController = controller;
          },
          markers: Set<Marker>.of(markers.values)),
    );
  }
}
