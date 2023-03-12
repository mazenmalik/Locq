import 'package:flutter/material.dart';
import 'package:locq/resources/functions.dart';
import 'package:locq/Widgets/locq_widgets.dart';
import 'package:locq/view%20model/station_viewmodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locq/view/landing%20screen/widgets/google_map.dart';

class ListOfNearByStations extends StatefulWidget {
  const ListOfNearByStations({Key? key, required this.value}) : super(key: key);
  final StationListViewModel value;

  @override
  State<ListOfNearByStations> createState() => _ListOfNearByStationsState();
}

class _ListOfNearByStationsState extends State<ListOfNearByStations> {
  Object? val;
  @override
  Widget build(BuildContext context) {
    final length = widget.value.stationList.data!.data!.stations!.length;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: length < 3 ? length : 3,
      itemBuilder: (context, index) {
        final name = widget.value.stationList.data!.data!.stations![index].name
            .toString();
        final latitude =
            widget.value.stationList.data!.data!.stations![index].latitude;
        final longitude =
            widget.value.stationList.data!.data!.stations![index].longitude;
        return InkWell(
          onTap: () {
            googleMapController!.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(latitude, longitude), 14));
            setState((() => val = index));
          },
          child: StationListTile(
              val: val,
              name: name,
              latitude: checkDouble(latitude),
              longitude: checkDouble(longitude),
              index: index,
              onChanged: (value) => setState(() => val = value)),
        );
      },
    );
  }
}
