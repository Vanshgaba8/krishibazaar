import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krishibazaar/screens/Farmer/farmer_home_screen.dart';
import 'package:krishibazaar/utils/routes/routes_name.dart';
import 'package:krishibazaar/view/customer_signup.dart';
import 'package:krishibazaar/view/farmer_signup.dart';

import '../../screens/Customer/Customhome.dart';
import 'package:krishibazaar/view/login_view.dart';

import '../../screens/Customer/custNavBar.dart';
import 'package:krishibazaar/view/farmer_or_customer.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.FarmerHome:
        {
          return MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen());
        }
      case RoutesName.CustomerHome:
        {
          return MaterialPageRoute(
              builder: (BuildContext context) => CustomerNavbar());
        }
      case RoutesName.login:
        {
          return MaterialPageRoute(
              builder: (BuildContext context) => LoginScreen());
        }
      case RoutesName.FarmOrCust:
        {
          return MaterialPageRoute(
              builder: (BuildContext context) => FarmerOrCustomer());
        }
      case RoutesName.FarmerSignUp:
        {
          return MaterialPageRoute(
              builder: (BuildContext context) => SignUpFarmer());
        }
      case RoutesName.CustomerSignUp:
        {
          return MaterialPageRoute(
              builder: (BuildContext context) => SignUpCustomer());
        }
      default:
        {
          return MaterialPageRoute(
            builder: (_) {
              return const Scaffold(
                body: Center(
                  child: Text("No Routes defined"),
                ),
              );
            },
          );
        }
    }
  }
}
