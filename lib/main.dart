import 'package:flutter/material.dart';
import 'package:krishibazaar/utils/routes/routes.dart';
import 'package:krishibazaar/utils/routes/routes_name.dart';
import 'package:krishibazaar/view_model/auth_view_model.dart';
import 'package:krishibazaar/view_model/customer_view_model.dart';
import 'package:krishibazaar/view_model/farmer_view_model.dart';
import 'package:krishibazaar/view_model/product_view_model.dart';
import 'package:provider/provider.dart';
import 'screens/authorisation/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => FarmerViewModel()),
        ChangeNotifierProvider(create: (_) => CustomerViewModel()),
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
      ],
      child: MaterialApp(
        title: 'Krishi Bazaar',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor:
              const Color(0xFFFFF8D8), // Updated background color
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
