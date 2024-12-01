import 'package:flutter/material.dart';
import 'package:krishibazaar/repository/auth_repository.dart';
import 'package:krishibazaar/utils/routes/routes_name.dart';
import 'package:krishibazaar/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(Map<String, String> data, BuildContext context) async {
    setLoading(true);
    try {
      final value = await _myRepo.loginApi(data);
      setLoading(false);
      Navigator.pushNamed(context, RoutesName.CustomerHome);
      Utils.showSuccessMessage('Login Successfully', context);
    } catch (error) {
      setLoading(false);
      Utils.showErrorMessage('An error occurred', context);
    }
  }

  Future<void> registerApi(
      Map<String, String> data, BuildContext context) async {
    setSignUpLoading(true);
    try {
      final value = await _myRepo.registerApi(data);
      setSignUpLoading(false);
      Navigator.pushNamed(context, RoutesName.CustomerHome);
      Utils.showSuccessMessage('Sign Up Successfully', context);
    } catch (error) {
      setSignUpLoading(false);
      Utils.showErrorMessage('An error occurred', context);
    }
  }
}
