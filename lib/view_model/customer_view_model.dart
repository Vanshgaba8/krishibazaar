import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:krishibazaar/models/customer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerViewModel with ChangeNotifier {
  // Saving token and role
  Future<bool> saveCustomer(CustomerModel customer) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', customer.token ?? '');
    sp.setString('role', customer.user?.role ?? '');
    notifyListeners(); // Make sure the listeners are notified when the state changes
    return true;
  }

  // Getting token and role from SharedPreferences
  Future<CustomerModel> getCustomer() async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      final String? token = sp.getString('token');
      final String? role = sp.getString('role');
      return CustomerModel(token: token, user: User(role: role));
    } catch (e) {
      debugPrint("Error in getting customer data: $e");
      rethrow;
    }
  }

  // Logging out by clearing the stored token and role
  Future<bool> logout() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    await sp.remove('token');
    await sp.remove('role');

    notifyListeners();
    return true;
  }
}
