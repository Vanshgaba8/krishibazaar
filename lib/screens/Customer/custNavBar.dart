import 'package:flutter/material.dart';
import 'package:krishibazaar/res/color.dart';
import 'package:krishibazaar/screens/Customer/CustDash.dart';
import 'package:krishibazaar/screens/Customer/Customhome.dart';
import 'package:krishibazaar/screens/Customer/custNoti.dart';
import 'package:krishibazaar/utils/routes/routes_name.dart';
import 'package:krishibazaar/utils/utils.dart';
import 'package:krishibazaar/view/profile_view.dart';
import 'package:provider/provider.dart';

import '../../view_model/customer_view_model.dart';

class CustomerNavbar extends StatefulWidget {
  const CustomerNavbar({super.key});

  @override
  State<CustomerNavbar> createState() => _CustomerNavbarState();
}

class _CustomerNavbarState extends State<CustomerNavbar> {
  int index = 0;
  bool isLoggingOut = false; // State to track logout progress

  final List<Widget> screens = [
    CustomerHomeScreen(),
    CustomerNotificationScreen(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final customerPreferences =
        Provider.of<CustomerViewModel>(context, listen: false);

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
                      await customerPreferences.logout();
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
