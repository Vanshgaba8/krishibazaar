import 'package:flutter/material.dart';
import 'package:krishibazaar/res/color.dart';
import 'package:krishibazaar/screens/Customer/view_cart.dart';

import 'browse_products.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Text
            const Text(
              'Welcome, Customer!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 20),

            // Grid of Features
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  // Browse Products Button
                  FeatureButton(
                    icon: Icons.shopping_basket,
                    label: 'Browse Products',
                    onPressed: () {
                      // Navigate to product list page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductListPage(),
                        ),
                      );
                    },
                  ),
                  // View Cart Button
                  FeatureButton(
                    icon: Icons.shopping_cart,
                    label: 'View Cart',
                    onPressed: () {
                      // Navigate to cart page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewCartPage(),
                        ),
                      );
                    },
                  ),
                  // Orders Button
                  FeatureButton(
                    icon: Icons.receipt_long,
                    label: 'My Orders',
                    onPressed: () {
                      // Navigate to orders page
                    },
                  ),
                  // Profile Button
                  FeatureButton(
                    icon: Icons.person,
                    label: 'Profile',
                    onPressed: () {
                      // Navigate to profile page
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Feature Button Widget
class FeatureButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const FeatureButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[100],
        padding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.green[700],
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.green[800],
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
