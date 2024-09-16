
import 'package:flutter/material.dart';
import 'package:krishibazaar/screens/Customer/CustDash.dart';
import 'package:krishibazaar/screens/Customer/Customhome.dart';
import 'package:krishibazaar/screens/Customer/custNoti.dart';

class CustomerNavbar extends StatefulWidget {
  const CustomerNavbar({super.key});

  @override
  State<CustomerNavbar> createState() => _CustomerNavbarState();
}

class _CustomerNavbarState extends State<CustomerNavbar> {
  int index = 0;

  final List<Widget> screens = [
    CustomerHomeScreen(),
    CustomerNotificationScreen(),
    Customerdashboard(),
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