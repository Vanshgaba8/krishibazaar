import 'package:flutter/cupertino.dart';
import 'package:krishibazaar/utils/routes/routes_name.dart';
import 'package:krishibazaar/view_model/customer_view_model.dart';
import '../../models/customer_model.dart';
import '../../utils/utils.dart';

class SplashServices {
  Future<CustomerModel> getUserData() => CustomerViewModel().getCustomer();

  void checkAuthentication(BuildContext context) async {
    try {
      CustomerModel value = await getUserData();
      debugPrint(value.toString());

      // Check if token is valid or empty
      if (value.token == null ||
          value.token!.isEmpty ||
          value.token == 'null') {
        Navigator.pushReplacementNamed(context, RoutesName.login);
      } else {
        if (value.user?.role == 'admin') {
          // Check role directly
          Navigator.pushReplacementNamed(context, RoutesName.FarmerHome);
        } else if (value.user?.role == 'user') {
          Navigator.pushReplacementNamed(context, RoutesName.CustomerHome);
        } else {
          // If role is undefined or invalid
          Navigator.pushReplacementNamed(context, RoutesName.login);
        }
      }
    } catch (error) {
      Utils.showErrorMessage("An error occurred: $error",
          context); // Show error with actual message
    }
  }
}
