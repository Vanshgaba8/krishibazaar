import '../../models/customer_product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductDataModel product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Color(0xFFFFF8D8), // Match the background color theme
      ),
      body: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            padding: const EdgeInsets.only(
                bottom:
                    80.0), // Add padding to avoid overlap with bottom buttons
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product image
                  Center(
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(child: Icon(Icons.error));
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Product name and price
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    product.price,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Product rating - Placeholder for now
                  Row(
                    children: [
                      Icon(Icons.star_border,
                          color: Colors.amber), // Placeholder star
                      Icon(Icons.star_border,
                          color: Colors.amber), // Placeholder star
                      Icon(Icons.star_border,
                          color: Colors.amber), // Placeholder star
                      Icon(Icons.star_border,
                          color: Colors.amber), // Placeholder star
                      Icon(Icons.star_border,
                          color: Colors.amber), // Placeholder star
                      SizedBox(width: 8),
                      Text(
                        '0 Ratings', // Placeholder text
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Product description
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  // Pincode Check Text Field
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Pincode',
                            border: OutlineInputBorder(),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Add pincode check functionality here
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Checking pincode availability...'),
                            ),
                          );
                        },
                        child: Text(
                          'Check',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.blueAccent, // Button background color
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Centered and bigger "Negotiate and Chat" button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Negotiate and Chat logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Opening chat for negotiation...'),
                          ),
                        );
                      },
                      child: Text(
                        'Negotiate and Chat',
                        style: TextStyle(
                          fontSize: 18, // Increase font size
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.indigoAccent, // New button color
                        padding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 40), // Bigger size
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Fixed buttons at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Color(0xFFFFF8D8),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Add to Cart logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added to cart!'),
                          ),
                        );
                      },
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.orangeAccent, // Button background color
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Buy Now logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Proceeding to buy!'),
                          ),
                        );
                      },
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.green, // Button background color
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
