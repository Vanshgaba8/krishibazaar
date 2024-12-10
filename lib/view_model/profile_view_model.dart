import 'package:flutter/material.dart';
import 'package:krishibazaar/repository/profile_repository.dart';
import 'package:krishibazaar/utils/utils.dart';
import 'package:krishibazaar/models/customer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel with ChangeNotifier {
  final _profileRepo = ProfileRepository();

  bool _loading = false;
  bool get loading => _loading;

  CustomerModel? _userProfile;
  CustomerModel? get userProfile => _userProfile;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  /// Fetch token from SharedPreferences
  Future<String?> _getTokenFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token'); // Adjust key if needed
  }

  /// Fetch user profile data using token from SharedPreferences
  Future<void> fetchUserProfile(BuildContext context) async {
    setLoading(true);
    try {
      final token = await _getTokenFromSharedPreferences();
      if (token == null) {
        Utils.showErrorMessage('No token found. Please log in again.', context);
        return;
      }
      final response = await _profileRepo.fetchUserProfile(token);
      _userProfile = CustomerModel.fromJson(response); // Assuming your model
      // Utils.showSuccessMessage('Profile fetched successfully.', context);
    } catch (error) {
      Utils.showErrorMessage('Failed to fetch profile: $error', context);
    } finally {
      setLoading(false);
    }
  }
}
