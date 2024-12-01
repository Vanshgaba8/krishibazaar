import 'package:flutter/material.dart';
import 'package:krishibazaar/screens/authorisation/signupcustomer.dart';
import 'package:krishibazaar/utils/routes/routes_name.dart';
import 'package:krishibazaar/view/farmer_signup.dart';

import '../res/components/role_selection_container.dart';

class FarmerOrCustomer extends StatelessWidget {
  const FarmerOrCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    // Getting the screen height and width using MediaQuery
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8D8),
        title: const Text(
          "Choose your Account type",
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          // Using SingleChildScrollView to prevent overflow
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoleSelectionContainer(
                roleText: 'a Farmer',
                imagePath: 'assets/images/farmer.png',
                routeName: RoutesName.FarmerSignUp,
              ),
              SizedBox(
                height: h * 0.05,
              ),
              RoleSelectionContainer(
                roleText: 'a Customer',
                imagePath: 'assets/images/customer.png',
                routeName: RoutesName.CustomerSignUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
