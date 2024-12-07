import 'package:flutter/material.dart';
import 'package:krishibazaar/repository/auth_repository.dart';
import 'package:krishibazaar/utils/routes/routes_name.dart';
import 'package:krishibazaar/utils/utils.dart';
import 'package:krishibazaar/view_model/customer_view_model.dart';
import 'package:krishibazaar/models/customer_model.dart';
import 'package:provider/provider.dart';

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

      if (value['success'] == true) {
        String role =
            value['user']['role']; // Extract the role from the response
        String token = value['token']; // Assuming the token is in the response

        // Save the customer data to SharedPreferences
        await Provider.of<CustomerViewModel>(context, listen: false)
            .saveCustomer(CustomerModel(token: token, user: User(role: role)));

        // Navigate based on the role
        if (role == 'user') {
          Navigator.pushReplacementNamed(context, RoutesName.CustomerHome);
          // Show success message
          Utils.showSuccessMessage('Login Successfully', context);
        } else if (role == 'admin') {
          Navigator.pushReplacementNamed(context, RoutesName.FarmerHome);
          // Show success message
          Utils.showSuccessMessage('Login Successfully', context);
        }
      } else {
        // Handle unsuccessful login
        Utils.showErrorMessage('Login failed. Please try again.', context);
      }
    } catch (error) {
      setLoading(false);
      Utils.showErrorMessage('An error occurred: $error', context);
    }
  }

  Future<void> registerApi(
      Map<String, String> data, BuildContext context) async {
    setSignUpLoading(true);
    try {
      final value = await _myRepo
          .registerApi(data); // Send registration data to the backend
      setSignUpLoading(false);

      if (value['success'] == true) {
        // After successful registration, show a success message
        Utils.showSuccessMessage(
          'A verification email has been sent. Please check your inbox to verify your email.',
          context,
        );

        // Navigate to the login page after a successful registration
        Navigator.pushReplacementNamed(context, RoutesName.login);
      } else {
        // Handle unsuccessful registration
        Utils.showErrorMessage('Sign Up failed. Please try again.', context);
      }
    } catch (error) {
      setSignUpLoading(false);
      Utils.showErrorMessage('An error occurred: $error', context);
    }
  }
}
