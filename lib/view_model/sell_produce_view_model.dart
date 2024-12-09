import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:krishibazaar/res/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:krishibazaar/utils/utils.dart';
import 'package:http/http.dart' as http;
import '../data/network/network_api_services.dart';

class SellProduceModel extends ChangeNotifier {
  final List<String> _categories = [];
  String? selectedCategory;

  List<String> get categories => _categories;

  final NetworkApiService _apiService = NetworkApiService();

  Future<void> fetchCategories(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      debugPrint('Token: $token');

      if (token == null || token == 'null') {
        Utils.showErrorMessage("User not authenticated", context);
        return;
      }

      final url = AppUrl.categoryList;

      debugPrint('Fetching categories from $url');
      final response = await http
          .get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});
      final data = jsonDecode(response.body);

      debugPrint('Categories fetched: $data');

      if (data is Map<String, dynamic> && data.containsKey('categories')) {
        _categories.clear();
        for (var category in data['categories']) {
          _categories.add(category['category']);
        }
        notifyListeners();
      } else {
        Utils.showErrorMessage("Invalid data format", context);
        debugPrint('Invalid data format: $data');
      }
    } catch (e) {
      Utils.showErrorMessage(e.toString(), context);
      debugPrint('Error fetching categories: $e');
    }
  }

  Future<void> addCategory(String newCategory, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      debugPrint('Token: $token');

      if (token == null) {
        Utils.showErrorMessage("User not authenticated", context);
        return;
      }

      final url = AppUrl.addCategory;
      final body = {'category': newCategory};

      debugPrint('Adding category $newCategory to $url');
      await _apiService.postWithBearerToken(url, body, token);
      Utils.showSuccessMessage("Category added successfully", context);
      await fetchCategories(context); // Refresh categories
    } catch (e) {
      Utils.showErrorMessage(e.toString(), context);
      debugPrint('Error adding category: $e');
    }
  }

  Future<void> addProduct(
    String name,
    String quantity,
    String price,
    String description,
    File? image,
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      debugPrint('Token: $token');

      if (token == null) {
        Utils.showErrorMessage("User not authenticated", context);
        return;
      }

      final url = AppUrl.addProduct;

      // Prepare data for the request
      final data = {
        'name': name,
        'stock': quantity,
        'price': price,
        'description': description,
        'category': selectedCategory ?? '',
        'file': image, // Use 'file' as the key for the image
      };

      // Use postWithBearerToken to send data (including image)
      final response = await _apiService.postWithBearerToken(url, data, token);

      if (response != null && response is Map<String, dynamic>) {
        Utils.showSuccessMessage("Product added successfully", context);
      } else {
        Utils.showErrorMessage("Unexpected response format", context);
      }
    } catch (e) {
      Utils.showErrorMessage(e.toString(), context);
      debugPrint('Error adding product: $e');
    }
  }
}
