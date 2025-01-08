import 'package:flutter/foundation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/network/network_api_services.dart';
import '../res/app_url.dart';

class PaymentOptionsViewModel extends ChangeNotifier {
  final NetworkApiService _apiService = NetworkApiService();

  // Method to process payment
  Future<bool> processPayment(double totalAmount) async {
    try {
      // Retrieve token from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      debugPrint("Retrieved token: $token");

      // Check if token is null (user not authenticated)
      if (token == null) {
        throw Exception("User not authenticated");
      }

      // Prepare the data for the request
      Map<String, dynamic> data = {
        'totalAmount':
            totalAmount.toStringAsFixed(2), // Format the total amount
      };

      // Call the postWithBearerToken method to initiate payment process
      var response = await _apiService.onlyPostWithBearerToken(
        AppUrl.paymentOnline, // API URL for the payment
        data,
        token, // Bearer token for authentication
      );

      // Check if the response is successful and contains the client secret
      if (response != null && response['success'] == true) {
        debugPrint("Payment processed successfully: ${response.toString()}");

        // Extract the client secret from the response
        String clientSecret = response['client_secret'];

        // Initialize the Payment Sheet with the client secret
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: clientSecret,
            merchantDisplayName: 'Your App Name', // Change as needed
          ),
        );

        // Present the Payment Sheet for the user to complete the payment
        await Stripe.instance.presentPaymentSheet();

        debugPrint("Payment completed successfully!");
        return true; // Return true indicating payment was successful
      } else {
        debugPrint("Payment failed: ${response.toString()}");
        return false; // Return false indicating payment failed
      }
    } catch (e) {
      // Handle Stripe specific exceptions
      if (e is StripeException) {
        debugPrint("Stripe Exception: ${e.error.localizedMessage}");
      } else {
        debugPrint(AppUrl.paymentOnline);
        debugPrint("Error: $e");
      }
      return false; // Return false indicating an error occurred
    }
  }
}
