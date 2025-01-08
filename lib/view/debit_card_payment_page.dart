import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DebitCardPaymentPage extends StatelessWidget {
  final double totalAmount;

  const DebitCardPaymentPage({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  Future<void> processDebitCardPayment(BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('https://your-backend.example.com/create-payment-intent'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer your-bearer-token',
        },
        body: json.encode({
          'totalAmount': totalAmount.toString(),
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Payment successful!")),
        );
        Navigator.pop(context); // Navigate back to payment options
      } else {
        throw Exception("Payment failed with status: ${response.statusCode}");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Payment failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Debit Card Payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You selected Debit Card Payment.",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              "Total Amount to be Paid: ₹$totalAmount",
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => processDebitCardPayment(context),
              child: const Text("Proceed to Pay"),
            ),
          ],
        ),
      ),
    );
  }
}
