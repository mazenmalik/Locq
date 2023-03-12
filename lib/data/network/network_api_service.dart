import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:locq/data/network/base_api_service.dart';
import 'package:locq/data/response/app_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkApiService extends BaseApiServices {
  SharedPreferences? sharedPreferences;

  @override
  Future getApiResponse(String url, dynamic data) async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    dynamic responseJson;

    Map<String, String> requestHeaders = {'Authorization': '$token'};
    try {
      final response = await http
          .get(Uri.parse(url).replace(queryParameters: data),
              headers: requestHeaders)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future postApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      responseJson = returnResponse(response);

      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error accured while communicating with server'
            ' with status code ${response.statusCode.toString()} ');
    }
  }
}
