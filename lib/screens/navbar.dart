import 'package:flutter/material.dart';
import 'package:krishibazaar/screens/dashboard.dart';
import 'package:krishibazaar/screens/farmer_home_screen.dart';
import 'package:krishibazaar/screens/notificationscreen.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int index = 0;

  final List<Widget> screens = [
    HomeScreen(),
    NotificationScreen(),
    DashboardScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8D8),
      appBar: AppBar(
        title: const Text(
          'Krishi Bazaar',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[700], // Green theme for app
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index, // This determines the selected item
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        elevation: 5,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.green[300],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              size: 30,
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: IndexedStack(
        index: index,
        children: screens,
      ),
    );
  }
}
