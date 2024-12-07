import 'package:flutter/material.dart';
import 'package:krishibazaar/models/product_model.dart';
import 'package:krishibazaar/data/network/network_api_services.dart';
import 'package:krishibazaar/utils/utils.dart';
import '../res/app_url.dart';

class ProductViewModel extends ChangeNotifier {
  final NetworkApiService _apiService = NetworkApiService();
  List<ProductModel> _products = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null; // Reset previous errors
    notifyListeners();

    try {
      final response =
          await _apiService.getGetApiResponse(AppUrl.viewProductList);
      if (response != null) {
        _products = List<ProductModel>.from(
            response.map((product) => ProductModel.fromJson(product)));
        _errorMessage = null;
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
