import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'package:krishibazaar/utils/routes/routes_name.dart'; // Make sure to import the RoutesName

class ProductDetailView extends StatelessWidget {
  final Products product;

  const ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name ?? 'Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Section
                    SizedBox(
                      height: 380,
                      child: InteractiveViewer(
                        boundaryMargin: const EdgeInsets.all(16),
                        minScale: 0.1,
                        maxScale: 4.0,
                        child: Image.network(
                          product.images?.isNotEmpty == true
                              ? product.images![0].url ?? ''
                              : 'https://www.example.com/placeholder-image.jpg',
                          height: 380,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Product Name
                    Text(
                      product.name ?? 'Unnamed Product',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Price
                    Text(
                      'Price: ₹${(product.price ?? 0).toDouble()}/Kg', // Display the price as int
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),

                    // Stock
                    Text(
                      'Stock: ${product.stock ?? 0} Kg',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),

                    // Description
                    Text(
                      'Description: ${product.description ?? 'No description available.'}',
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 16),

                    // Rating Section
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(
                          '${product.rating ?? 0}/5',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '(${product.numReviews ?? 0} reviews)',
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Reviews Section (Show only first 5 reviews)
                    if (product.reviews != null && product.reviews!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Reviews:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          ...product.reviews!.take(5).map((review) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                '- $review',
                                style: const TextStyle(fontSize: 14),
                              ),
                            );
                          }).toList(),
                          if (product.reviews!.length > 5)
                            const Text(
                              '...more reviews',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                        ],
                      )
                    else
                      const Text(
                        'No reviews available.',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                  ],
                ),
              ),
            ),
          ),

          // Action Buttons (Add to Cart and Buy Now)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Add to Cart Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add to Cart action
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to cart!')),
                      );
                    },
                    child: const Text('Add to Cart'),
                  ),
                ),
                const SizedBox(width: 16),

                // Buy Now Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to PaymentOptionsView using named routes and pass int amount
                      Navigator.pushNamed(
                        context,
                        RoutesName
                            .payOption, // Define this route in your RoutesName
                        arguments: (product.price ?? 0)
                            .toDouble(), // Passing the amount as int
                      );
                    },
                    child: const Text('Buy Now'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
