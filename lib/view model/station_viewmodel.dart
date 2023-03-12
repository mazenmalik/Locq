import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:locq/data/response/api_response.dart';
import 'package:locq/model/get_station_list_model.dart';
import 'package:locq/data/repository/station_list_repository.dart';

Position? currentPosition;

class StationListViewModel extends ChangeNotifier {
  final _myRepo = StationListRepository();
  bool _loading = false;
  bool get loading => _loading;

  dynamic _station;
  dynamic _allStation;
  dynamic get station => _searchString.isEmpty ? _station : _station;
  String _searchString = "";

  void changeSearchString(String searchString) {
    _searchString = searchString;
    loadFilteredList(_searchString);
    notifyListeners();
  }

  loadFilteredList(String searchValue) {
    dynamic json = _allStation.toJson();
    dynamic filteredJson = _allStation.toJson();
    List unfiltered = json['data']['stations'];
    List filtered = unfiltered
        .where((map) =>
            map["name"].toLowerCase().contains(searchValue.toLowerCase()))
        .toList();
    filteredJson['data']['stations'] = filtered;
    _station = GetStationListModel.fromJson(filteredJson);
    notifyListeners();
  }

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  loadStationList(dynamic data) {
    _allStation = data;
    _station = data;
    notifyListeners();
  }

  ApiResponse<GetStationListModel> stationList = ApiResponse.loading();
  setStationList(ApiResponse<GetStationListModel> response) {
    stationList = response;
    notifyListeners();
  }

  Future<void> fetchStationListApi(BuildContext context, data) async {
    setStationList(ApiResponse.loading());

    _myRepo.fetchStationList(context, data).then((value) {
      setStationList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setStationList(ApiResponse.error(error.toString()));
    });
  }

  Future<void> getCurrentPosition(BuildContext context) async {
    Map<String, dynamic> queryParams = {'page': '1', 'perPage': '1000'};
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      fetchStationListApi(context, queryParams);
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
