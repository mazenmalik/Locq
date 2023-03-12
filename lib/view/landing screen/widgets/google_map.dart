import 'package:flutter/material.dart';
import 'package:locq/view%20model/station_viewmodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locq/data/repository/station_list_repository.dart';

GoogleMapController? googleMapController;

class GoogleMaps extends StatelessWidget {
  const GoogleMaps({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: currentPosition == null
          ? Container()
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      currentPosition!.latitude, currentPosition!.longitude),
                  zoom: 14),
              mapType: MapType.normal,
              myLocationEnabled: true,
              padding: EdgeInsets.only(bottom: 330),
              onMapCreated: (controller) {
                googleMapController = controller;
              },
              markers: Set<Marker>.of(markers.values)),
    );
  }
}
