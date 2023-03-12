class GetStationListModel {
  String? message;
  Data? data;

  GetStationListModel({this.message, this.data});

  GetStationListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Stations>? stations;
  int? count;

  Data({this.stations, this.count});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['stations'] != null) {
      stations = <Stations>[];
      json['stations'].forEach((v) {
        stations!.add(Stations.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (stations != null) {
      data['stations'] = stations!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class Stations {
  int? stationId;
  int? depotId;
  String? name;
  int? stationCode;
  String? mobileNumber;
  dynamic latitude;
  dynamic longitude;
  String? province;
  String? city;
  String? address;
  String? stationType;
  String? opensAt;
  String? closesAt;
  String? status;
  bool? isPlbOnboarded;
  bool? isPlcOnboarded;
  String? businessName;
  String? createdAt;
  StationProduct? stationProduct;

  Stations(
      {this.stationId,
      this.depotId,
      this.name,
      this.stationCode,
      this.mobileNumber,
      this.latitude,
      this.longitude,
      this.province,
      this.city,
      this.address,
      this.stationType,
      this.opensAt,
      this.closesAt,
      this.status,
      this.isPlbOnboarded,
      this.isPlcOnboarded,
      this.businessName,
      this.createdAt,
      this.stationProduct});

  Stations.fromJson(Map<String, dynamic> json) {
    stationId = json['stationId'];
    depotId = json['depotId'];
    name = json['name'];
    stationCode = json['stationCode'];
    mobileNumber = json['mobileNumber'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    province = json['province'];
    city = json['city'];
    address = json['address'];
    stationType = json['stationType'];
    opensAt = json['opensAt'];
    closesAt = json['closesAt'];
    status = json['status'];
    isPlbOnboarded = json['isPlbOnboarded'];
    isPlcOnboarded = json['isPlcOnboarded'];
    businessName = json['businessName'];
    createdAt = json['createdAt'];
    stationProduct = json['stationProduct'] != null
        ? StationProduct.fromJson(json['stationProduct'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stationId'] = stationId;
    data['depotId'] = depotId;
    data['name'] = name;
    data['stationCode'] = stationCode;
    data['mobileNumber'] = mobileNumber;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['province'] = province;
    data['city'] = city;
    data['address'] = address;
    data['stationType'] = stationType;
    data['opensAt'] = opensAt;
    data['closesAt'] = closesAt;
    data['status'] = status;
    data['isPlbOnboarded'] = isPlbOnboarded;
    data['isPlcOnboarded'] = isPlcOnboarded;
    data['businessName'] = businessName;
    data['createdAt'] = createdAt;
    if (stationProduct != null) {
      data['stationProduct'] = stationProduct!.toJson();
    }
    return data;
  }
}

class StationProduct {
  bool? diesel;
  bool? gas91;
  bool? gas95;
  bool? gas97;

  StationProduct({this.diesel, this.gas91, this.gas95, this.gas97});

  StationProduct.fromJson(Map<String, dynamic> json) {
    diesel = json['diesel'];
    gas91 = json['gas91'];
    gas95 = json['gas95'];
    gas97 = json['gas97'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['diesel'] = diesel;
    data['gas91'] = gas91;
    data['gas95'] = gas95;
    data['gas97'] = gas97;
    return data;
  }
}
