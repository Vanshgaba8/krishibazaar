import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../repository/product_repository.dart';

class ParticularProductViewModel extends ChangeNotifier {
  final ProductRepository _repository = ProductRepository();

  Products? _productDetails;
  String? _errorMessage;
  bool _isLoading = false;

  Products? get productDetails => _productDetails;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> fetchProductDetails(
      String productId, BuildContext context) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Fetch products and find the particular one by ID
      final productsList = await _repository.fetchProducts(context);
      if (productsList != null) {
        _productDetails = productsList.products?.firstWhere(
          (product) => product.id == productId,
          orElse: () => throw Exception('Product not found'),
        );
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
