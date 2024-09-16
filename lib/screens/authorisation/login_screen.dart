import 'package:flutter/material.dart';
import 'package:krishibazaar/screens/authorisation/farmorcust.dart';
import 'package:krishibazaar/screens/Farmer/navbar.dart';
import 'package:krishibazaar/screens/authorisation/language_screen.dart';

import '../Customer/Customhome.dart';
import '../Farmer/farmer_home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8D8),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 10),
            icon: const Icon(
              Icons.language,
              color: Colors.brown,
              size: 30,
            ), // Updated with language icon
            onPressed: () {
              // Navigate to the language selection page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LanguageSelectionPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth < 600 ? 400 : 500,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo Section
                      Column(
                        children: [
                          // const SizedBox(height: 5),
                          Image.asset(
                            'assets/images/krishi_logo.png',
                            height: constraints.maxWidth < 600 ? 200 : 250,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Welcome back User',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5D4037),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Username Field
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                          prefixIcon: const Icon(Icons.person),
                          filled: true,
                          fillColor: Colors.green[100],
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.brown, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          floatingLabelStyle: const TextStyle(
                              color: Color.fromARGB(255, 101, 67, 33),
                              fontSize: 18),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 101, 67, 33),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Password Field
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          filled: true,
                          fillColor: Colors.green[100],
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.brown, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          floatingLabelStyle: const TextStyle(
                              color: Color.fromARGB(255, 101, 67, 33),
                              fontSize: 18),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 101, 67, 33),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.visibility),
                            onPressed: () {
                              // toggle password visibility
                            },
                          ),
                        ),
                      ),

                      // Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // forgot password logic
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.brown),
                          ),
                        ),
                      ),

                      // Sign In Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // sign in logic
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Navbar()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[600],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'Sign In',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Sign Up
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              // navigate to sign up
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FarmerOrCustomer()),
                              );
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
