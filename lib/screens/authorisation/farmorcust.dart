import 'package:flutter/material.dart';
import 'package:krishibazaar/screens/authorisation/signupcustomer.dart';
import 'package:krishibazaar/screens/authorisation/signuppage.dart';

class FarmerOrCustomer extends StatelessWidget {
  const FarmerOrCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    // Getting the screen height and width using MediaQuery
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8D8),
        title: const Text(
          "Choose your Account type",
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          // Using SingleChildScrollView to prevent overflow
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    //sign up page for farmer
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpFarmer()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green[100],
                    ),
                    // Make height and width responsive using MediaQuery
                    height: h * 0.25,
                    width: w * 0.85,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 23,
                              ),
                              children: <TextSpan>[
                                TextSpan(text: '  I am a '),
                                TextSpan(
                                  text: 'Farmer ',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 8, 99, 11),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          // Setting a responsive width for the image
                          width: w / 4,
                          child: Image.asset("assets/images/farmer.png"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    //sign up page for customer
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpCustomer()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green[100],
                    ),
                    // Make height and width responsive using MediaQuery
                    height: h * 0.25,
                    width: w * 0.85,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 23,
                              ),
                              children: <TextSpan>[
                                TextSpan(text: '  I am a '),
                                TextSpan(
                                  text: 'Customer ',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          // Setting a responsive width for the image
                          width: w / 4,
                          child: Image.asset("assets/images/customer.png"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
