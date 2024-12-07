import 'package:flutter/material.dart';
import 'package:krishibazaar/models/farmer_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FarmerViewModel with ChangeNotifier {
  Future<bool> saveFarmer(FarmerModel farmer) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', farmer.token.toString());
    sp.setString('role', farmer.user.toString());

    notifyListeners();
    return true;
  }

  Future<FarmerModel> getFarmer() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    final String? role = sp.getString('role');
    notifyListeners();
    return FarmerModel(
      token: token.toString(),
      user: User(role: role.toString()),
    );
  }

  Future<bool> logout() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    sp.remove('role');
    notifyListeners();
    return true;
  }
}
