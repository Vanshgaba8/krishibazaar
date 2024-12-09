import 'package:flutter/material.dart';
import '../repository/category_repository.dart';
import '../utils/utils.dart';

class CategoryViewModel with ChangeNotifier {
  final CategoryRepository _categoryRepo = CategoryRepository();

  bool _loading = false;
  bool get loading => _loading;

  // This will hold the mapping of category ID to category name
  Map<String, String> _categoryMap = {};
  Map<String, String> get categoryMap => _categoryMap;

  // Loading state setter
  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // Fetch Categories
  Future<void> fetchCategories(BuildContext context) async {
    _setLoading(true);
    try {
      // Fetch raw response
      final fetchedData = await _categoryRepo.fetchCategoryList();

      // Extract categories from the response
      if (fetchedData is Map<String, dynamic> &&
          fetchedData['success'] == true &&
          fetchedData.containsKey('categories')) {
        final fetchedCategories = fetchedData['categories'];

        if (fetchedCategories is List) {
          _categoryMap = {
            for (var category in fetchedCategories)
              category['_id']:
                  category['category'], // Adjusted for your API response
          };
          notifyListeners();
          // Utils.showSuccessMessage('Categories fetched successfully!', context);
        } else {
          throw Exception('Expected "categories" to be a List.');
        }
      } else {
        throw Exception('Invalid response format or unsuccessful request.');
      }
    } catch (error) {
      Utils.showErrorMessage('Failed to fetch categories: $error', context);
    } finally {
      _setLoading(false);
    }
  }
}
