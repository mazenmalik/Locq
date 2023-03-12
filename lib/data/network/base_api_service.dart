abstract class BaseApiServices {
  Future<dynamic> getApiResponse(String url, dynamic data);

  Future<dynamic> postApiResponse(String url, dynamic data);
}
