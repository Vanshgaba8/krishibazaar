import 'package:krishibazaar/data/network/base_api_services.dart';
import 'package:krishibazaar/data/network/network_api_services.dart';
import 'package:krishibazaar/res/app_url.dart';

class ProfileRepository {
  BaseApiServices _apiServices = NetworkApiService();

  /// Fetch user profile data using a bearer token.
  Future<dynamic> fetchUserProfile(String token) async {
    try {
      dynamic response = await _apiServices.getWithBearerToken(
        AppUrl.userProfile,
        token,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }

  /// Update user profile data with new information.
  Future<dynamic> updateUserProfile(String token, dynamic data) async {
    try {
      dynamic response = await _apiServices.postWithBearerToken(
        AppUrl.userProfile,
        data,
        token,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }
}
