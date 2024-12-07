import 'package:flutter/cupertino.dart';
import 'package:krishibazaar/data/network/base_api_services.dart';
import 'package:krishibazaar/data/network/network_api_services.dart';
import 'package:krishibazaar/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      debugPrint(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
