import 'package:flutter/cupertino.dart';
import 'package:krishibazaar/data/network/base_api_services.dart';
import 'package:krishibazaar/data/network/network_api_services.dart';
import 'package:krishibazaar/res/app_url.dart';

class CategoryRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> fetchCategoryList() async {
    try {
      // Make a GET request to fetch all categories
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.categoryList);
      debugPrint("Category List: ${response.toString()}");
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> addCategory(dynamic data, String token) async {
    try {
      // Make a POST request to add a new category using bearer token
      dynamic response = await _apiServices.postWithBearerToken(
        AppUrl.addCategory,
        data,
        token,
      );
      debugPrint("Add Category Response: ${response.toString()}");
      return response;
    } catch (e) {
      throw e;
    }
  }
}
