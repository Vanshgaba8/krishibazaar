import 'package:flutter/material.dart';
import '../repository/product_repository.dart';
import '../models/product_model.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository _productRepository;

  ProductViewModel()
      : _productRepository = ProductRepository(); // No baseUrl required here

  bool _isLoading = false;
  String? _errorMessage;
  ProductModel? _productModel;

  // Getters
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  ProductModel? get productModel => _productModel;

  // Fetch product data from the repository
  Future<void> fetchProducts(BuildContext context) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final fetchedProducts = await _productRepository.fetchProducts(context);
      _productModel = fetchedProducts;
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
