import 'package:flutter/material.dart';

class CODPage extends StatelessWidget {
  final double totalAmount;

  const CODPage({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cash on Delivery"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You selected Cash on Delivery.",
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
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Order placed successfully!")),
                );
                Navigator.pop(context); // Navigate back to payment options
              },
              child: const Text("Confirm Order"),
            ),
          ],
        ),
      ),
    );
  }
}
