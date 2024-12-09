import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../utils/utils.dart';
import '../res/app_url.dart'; // Centralized location for API URLs

class ProductRepository {
  /// Fetch product list from the backend
  Future<ProductModel?> fetchProducts(BuildContext context) async {
    try {
      // Fetch products using the API URL defined in AppUrl
      final response = await http.get(Uri.parse(AppUrl.viewProductList));

      if (response.statusCode == 200) {
        // Parse the response body into a ProductModel object
        final Map<String, dynamic> data = json.decode(response.body);
        // debugPrint(data.toString());
        return ProductModel.fromJson(data);
      } else {
        // Show error message if the backend returns an error
        Utils.showErrorMessage(
            'Failed to fetch products: ${response.reasonPhrase}', context);
        return null;
      }
    } catch (e) {
      // Handle any network or decoding errors
      Utils.showErrorMessage(
          'Error occurred while fetching products: $e', context);
      return null;
    }
  }

  /// Add a new product to the backend
  Future<dynamic> addProduct(
      dynamic data, String token, BuildContext context) async {
    try {
      // Add a new product using the API URL defined in AppUrl
      final response = await http.post(
        Uri.parse(AppUrl.addProduct),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(data),
      );

      if (response.statusCode == 201) {
        // Return the successful response body
        return json.decode(response.body);
      } else {
        // Show error message if the backend returns an error
        Utils.showErrorMessage(
            'Failed to add product: ${response.reasonPhrase}', context);
        return null;
      }
    } catch (e) {
      // Handle any network or decoding errors
      Utils.showErrorMessage(
          'Error occurred while adding product: $e', context);
      return null;
    }
  }
}
