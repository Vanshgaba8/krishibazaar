import 'package:flutter/material.dart';
import 'screens/authorisation/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Krishi Bazaar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor:
            const Color(0xFFFFF8D8), // Updated background color
      ),
      home: const LoginScreen(),
    );
  }
}
