import 'package:flutter/material.dart';
import 'package:krishibazaar/models/farmer_model.dart';
import 'package:krishibazaar/res/color.dart';
import 'package:krishibazaar/screens/Farmer/dashboard.dart';
import 'package:krishibazaar/screens/Farmer/farmer_home_screen.dart';
import 'package:krishibazaar/screens/Farmer/notificationscreen.dart';
import 'package:krishibazaar/view/profile_view.dart';
import 'package:provider/provider.dart';

import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../../view_model/farmer_view_model.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int index = 0;
  bool isLoggingOut = false;

  final List<Widget> screens = [
    HomeScreen(),
    NotificationScreen(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final farmerPreferences = Provider.of<FarmerViewModel>(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Krishi Bazaar',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[700], // Green theme for app
        actions: [
          isLoggingOut
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.5,
                    ),
                  ),
                )
              : IconButton(
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  tooltip: 'Logout',
                  onPressed: () async {
                    setState(() {
                      isLoggingOut =
                          true; // Start showing the progress indicator
                    });

                    try {
                      await farmerPreferences.logout();
                      Utils.showSuccessMessage(
                          'Logged out successfully', context);

                      // Navigate to the login screen
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesName.login,
                        (route) => false,
                      );
                    } catch (error) {
                      Utils.showErrorMessage('Logout failed: $error', context);
                    } finally {
                      setState(() {
                        isLoggingOut =
                            false; // Stop showing the progress indicator
                      });
                    }
                  },
                ),
        ],
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
