abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiResponse(String url, dynamic data);

  Future<dynamic> postWithBearerToken(String url, dynamic data, String token);

  Future<dynamic> getWithBearerToken(String url, String token);

  Future<dynamic> onlyPostWithBearerToken(
      String url, dynamic data, String token);
}
