import 'package:flutter/material.dart';
import 'package:krishibazaar/screens/autherisation/farmorcust.dart';
import 'package:krishibazaar/screens/autherisation/login_screen.dart';
import 'package:krishibazaar/screens/home_screen.dart';

class SignUpFarmer extends StatefulWidget {
  const SignUpFarmer({super.key});

  @override
  State<SignUpFarmer> createState() => _SignUpFarmerState();
}

class _SignUpFarmerState extends State<SignUpFarmer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          const SizedBox(height: 20),
                          Image.asset(
                            'assets/images/krishi_logo.png',
                            height: constraints.maxWidth < 600 ? 200 : 250,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Welcome Farmer',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // name Field
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          prefixIcon: const Icon(Icons.person),
                          filled: true,
                          fillColor: Colors.green[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      //email id Field

                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email ID',
                          prefixIcon: const Icon(Icons.person),
                          filled: true,
                          fillColor: Colors.green[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.visibility),
                            onPressed: () {
                              // toggle password visibility
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      //phone no. Field

                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Phone No.',
                          prefixIcon: const Icon(Icons.person),
                          filled: true,
                          fillColor: Colors.green[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // address Field

                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Address',
                          prefixIcon: const Icon(Icons.person),
                          filled: true,
                          fillColor: Colors.green[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      //Upload File Field

                      TextField(
                        decoration: InputDecoration(
                          labelText: 'upload file',
                          prefixIcon: const Icon(Icons.person),
                          filled: true,
                          fillColor: Colors.green[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Sign In Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // sign in logic
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[400],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'Sign Up',
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
                          const Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              // navigate to sign up
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(color: Colors.green),
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
    ;
  }
}
