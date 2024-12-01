import 'package:flutter/material.dart';
import 'package:krishibazaar/screens/authorisation/farmorcust.dart';
import 'package:krishibazaar/screens/authorisation/login_screen.dart';
import 'package:krishibazaar/screens/Farmer/farmer_home_screen.dart';
import 'package:krishibazaar/screens/Farmer/navbar.dart';

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
                              color: Color(0xFF5D4037),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // name Field
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Name',
                            prefixIcon: const Icon(Icons.person),
                            filled: true,
                            fillColor: Colors.green[100],
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.brown, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            floatingLabelStyle: const TextStyle(
                                color: Color.fromARGB(255, 101, 67, 33),
                                fontSize: 18),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 101, 67, 33),
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      const SizedBox(height: 15),

                      //email id Field

                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Email ID',
                            prefixIcon: const Icon(Icons.mail),
                            filled: true,
                            fillColor: Colors.green[100],
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.brown, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            floatingLabelStyle: const TextStyle(
                                color: Color.fromARGB(255, 101, 67, 33),
                                fontSize: 18),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 101, 67, 33),
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      const SizedBox(height: 15),

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
                            borderRadius: BorderRadius.circular(10),
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
                      const SizedBox(height: 15),

                      //phone no. Field

                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Phone No.',
                            prefixIcon: const Icon(Icons.phone),
                            filled: true,
                            fillColor: Colors.green[100],
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.brown, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            floatingLabelStyle: const TextStyle(
                                color: Color.fromARGB(255, 101, 67, 33),
                                fontSize: 18),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 101, 67, 33),
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      const SizedBox(height: 15),

                      // address Field

                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Address',
                            prefixIcon: const Icon(Icons.location_city),
                            filled: true,
                            fillColor: Colors.green[100],
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.brown, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            floatingLabelStyle: const TextStyle(
                                color: Color.fromARGB(255, 101, 67, 33),
                                fontSize: 18),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 101, 67, 33),
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      const SizedBox(height: 15),

                      //Upload File Field

                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            labelText: 'Choose File',
                            prefixIcon: const Icon(Icons.file_copy),
                            filled: true,
                            fillColor: Colors.green[100],
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.brown, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            floatingLabelStyle: const TextStyle(
                                color: Color.fromARGB(255, 101, 67, 33),
                                fontSize: 18),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 101, 67, 33),
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            )),
                        items: [
                          DropdownMenuItem(
                              value: 'Income certificate',
                              child: Text('Income certificate')),
                          DropdownMenuItem(
                              value: 'Kisan Credit Card',
                              child: Text('Kisan Credit Card')),
                          DropdownMenuItem(
                              value: 'Aadhaar card',
                              child: Text('Aadhaar card')),
                          DropdownMenuItem(
                              value: 'Land Record(Khatauni)',
                              child: Text('Land Record(Khatauni)')),
                        ],
                        onChanged: (value) {
                          // Handle value change here
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a file type';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      GestureDetector(
                        onTap: () {
                          //for upload document function
                        },
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.yellow[100],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color(0xFFf29716), width: 2.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Upload document"),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.upload_file),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 15,
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
                              'Sign Up',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                      //const SizedBox(height: 10),

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
