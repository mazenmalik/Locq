import '../network/app_url.dart';
import 'package:flutter/material.dart';
import '../network/base_api_service.dart';
import 'package:geolocator/geolocator.dart';
import '../network/network_api_service.dart';
import 'package:locq/resources/functions.dart';
import 'package:locq/model/get_station_list_model.dart';
import 'package:locq/view%20model/station_viewmodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

class StationListRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future fetchStationList(BuildContext context, dynamic data) async {
    List stationList = [];

    try {
      dynamic response = await _apiServices.getApiResponse(
          AppUrl.stationListApiEndpoint, data);
      stationList = response['data']['stations'];
      stationList.sort((a, b) {
        return Geolocator.distanceBetween(
                checkDouble(a['latitude']),
                checkDouble(a['longitude']),
                currentPosition!.latitude,
                currentPosition!.longitude)
            .compareTo(Geolocator.distanceBetween(
                checkDouble(b['latitude']),
                checkDouble(b['longitude']),
                currentPosition!.latitude,
                currentPosition!.longitude));
      });

      for (int i = 0; i < stationList.length; i++) {
        add(
            stationList[i]['businessName'],
            checkDouble(stationList[i]['latitude']),
            checkDouble(stationList[i]['longitude']),
            stationList[i]['address']);
      }

      response['data']['stations'] = stationList;

      return response = GetStationListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
