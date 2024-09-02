import 'package:flutter/material.dart';
import 'package:krishibazaar/screens/autherisation/signupcustomer.dart';
import 'package:krishibazaar/screens/autherisation/signuppage.dart';

class FarmerOrCustomer extends StatelessWidget {
  const FarmerOrCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF8D8),
        title: Text(
          "Choose your Account type",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
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
                  height: 200,
                  width: double.maxFinite,
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
                                      color: Color.fromARGB(255, 8, 99, 11))),
                            ]),
                      )),
                      SizedBox(child: Image.asset("assets/images/farmer.png"))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  //sign up page for farmer
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
                  height: 200,
                  width: double.maxFinite,
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
                                      color: Colors.brown)),
                            ]),
                      )),
                      SizedBox(child: Image.asset("assets/images/customer.png"))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
