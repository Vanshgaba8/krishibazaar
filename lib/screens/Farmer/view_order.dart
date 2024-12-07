import 'package:flutter/material.dart';
import 'package:krishibazaar/res/color.dart';

class ViewOrdersPage extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {
      'buyer': 'Rahul Sharma',
      'product': 'Tomatoes',
      'category': 'Vegetables',
      'quantity': '50 kg',
      'price': '₹1500',
      'status': 'Pending',
    },
    {
      'buyer': 'Sonal Verma',
      'product': 'Wheat',
      'category': 'Grains',
      'quantity': '100 kg',
      'price': '₹2000',
      'status': 'Shipped',
    },
    {
      'buyer': 'Vijay Patel',
      'product': 'Mangoes',
      'category': 'Fruits',
      'quantity': '20 kg',
      'price': '₹1200',
      'status': 'Delivered',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Orders"),
        backgroundColor: AppColors.whiteColor,
        iconTheme: const IconThemeData(color: Colors.brown),
      ),
      backgroundColor: AppColors.whiteColor, // Light yellow background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return Card(
              color: const Color(0xFFF3E5AB), // Beige color for the card
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text(
                  '${order['product']} - ${order['quantity']}',
                  style: const TextStyle(
                    color: Color(0xFF8B4513), // Saddle Brown for text
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Buyer: ${order['buyer']}\nCategory: ${order['category']}\nPrice: ${order['price']}\nStatus: ${order['status']}',
                  style:
                      const TextStyle(color: Color(0xFF6B4226)), // Dark Brown
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Update status or handle order management
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Green for "Manage" button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Manage',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
