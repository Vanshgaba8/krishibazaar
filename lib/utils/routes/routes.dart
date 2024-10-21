import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krishibazaar/screens/Farmer/farmer_home_screen.dart';
import 'package:krishibazaar/utils/routes/routes_name.dart';

import '../../screens/Customer/Customhome.dart';

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
              builder: (BuildContext context) => CustomerHomeScreen());
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
