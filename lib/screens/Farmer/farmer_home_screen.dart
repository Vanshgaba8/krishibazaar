import 'package:flutter/material.dart';
import 'package:krishibazaar/screens/Farmer/market_rate.dart';
import 'package:krishibazaar/screens/Farmer/sell_produce.dart';
import 'package:krishibazaar/screens/Farmer/view_order.dart';
import 'package:krishibazaar/utils/routes/routes_name.dart';

import '../Customer/view_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back, Farmer!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  FeatureButton(
                    icon: Icons.trending_up,
                    label: 'Check Market Rates',
                    onPressed: () {
                      // Navigate to market rates page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MarketDataPage(),
                        ),
                      );
                    },
                  ),
                  FeatureButton(
                    icon: Icons.shopping_cart,
                    label: 'Sell Produce',
                    onPressed: () {
                      // Navigate to sell produce page
                      Navigator.pushNamed(context, RoutesName.SellProduce);
                    },
                  ),
                  FeatureButton(
                    icon: Icons.receipt,
                    label: 'View Orders',
                    onPressed: () {
                      // Navigate to orders page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewOrdersPage(),
                        ),
                      );
                    },
                  ),
                  FeatureButton(
                    icon: Icons.shopping_basket,
                    label: 'Browse Products',
                    onPressed: () {
                      // Navigate to product list page
                      Navigator.pushNamed(context, RoutesName.productView);
                    },
                  ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
