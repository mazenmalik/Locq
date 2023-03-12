import 'package:intl/intl.dart';
import 'dart:math' show Random, asin, cos, sqrt;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locq/data/repository/station_list_repository.dart';

toTime(String time) {
  DateTime tempDate = DateFormat("HH:MM:ss").parse(time);
  var formattedTime = DateFormat('ha').format(tempDate);
  return formattedTime;
}

double checkDouble(dynamic value) {
  if (value is String) {
    return double.parse(value);
  } else {
    return value.toDouble();
  }
}

double distance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

void add(String markerIdval, double lat, double long, String address) {
  final Marker marker = Marker(
    markerId: MarkerId(markerIdval),
    position: LatLng(lat, long),
    infoWindow: InfoWindow(title: markerIdval, snippet: address),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
  );
  markers[MarkerId(markerIdval)] = marker;
}

double random(List list, List discount) {
  final random = Random();
  int index = random.nextInt(list.length);
  var element = list[index]['position'];
  discount.add(list[index]['value']);
  return element;
}

convertListToDouble(List discount) {
  double num =
      double.parse(discount.join().substring(discount.join().length - 4)) / 100;
  return num.toStringAsFixed(2);
}
