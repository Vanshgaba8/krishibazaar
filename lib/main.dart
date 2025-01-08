import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:krishibazaar/.env.dart';
import 'package:krishibazaar/res/color.dart';
import 'package:krishibazaar/utils/routes/routes.dart';
import 'package:krishibazaar/utils/routes/routes_name.dart';
import 'package:krishibazaar/view_model/auth_view_model.dart';
import 'package:krishibazaar/view_model/category_view_model.dart';
import 'package:krishibazaar/view_model/customer_view_model.dart';
import 'package:krishibazaar/view_model/farmer_view_model.dart';
import 'package:krishibazaar/view_model/particular_product_view_model.dart';
import 'package:krishibazaar/view_model/payment_options_view_model.dart';
import 'package:krishibazaar/view_model/product_view_model.dart';
import 'package:krishibazaar/view_model/profile_view_model.dart';
import 'package:krishibazaar/view_model/sell_produce_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = STRIPE_API_KEY;
  await Stripe.instance.applySettings();
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
        ChangeNotifierProvider(create: (_) => SellProduceModel()),
        ChangeNotifierProvider(create: (_) => CategoryViewModel()),
        ChangeNotifierProvider(create: (_) => ParticularProductViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => PaymentOptionsViewModel()),
      ],
      child: MaterialApp(
        title: 'Krishi Bazaar',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.green,
            scaffoldBackgroundColor: AppColors.whiteColor
            //const Color(0xFFFFF8D8), // Updated background color
            ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
