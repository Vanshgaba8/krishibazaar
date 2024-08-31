import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Krishi Bazaar'),
        backgroundColor: Colors.green[700], // Green theme for app
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Text
            const Text(
              'Welcome back, Farmer!',
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
                crossAxisCount: 2, // Two buttons per row
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  // Check Market Rates Button
                  FeatureButton(
                    icon: Icons.trending_up,
                    label: 'Check Market Rates',
                    onPressed: () {
                      // Navigate to market rates page
                    },
                  ),
                  // Sell Produce Button
                  FeatureButton(
                    icon: Icons.shopping_cart,
                    label: 'Sell Produce',
                    onPressed: () {
                      // Navigate to sell produce page
                    },
                  ),
                  // Orders Button
                  FeatureButton(
                    icon: Icons.receipt,
                    label: 'View Orders',
                    onPressed: () {
                      // Navigate to orders page
                    },
                  ),
                  // Profile Button
                  FeatureButton(
                    icon: Icons.person,
                    label: 'My Profile',
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

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.green[400],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Feature Button Widget
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
