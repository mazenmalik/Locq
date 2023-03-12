import '../network/app_url.dart';
import '../network/base_api_service.dart';
import '../network/network_api_service.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.postApiResponse(AppUrl.loginApiEndpoint, data);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
