import 'package:flutter/material.dart';
import 'package:krishibazaar/models/product_model_old.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name ?? "Unknown Product",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8.0),
            Text(product.description ?? "No description available"),
            SizedBox(height: 8.0),
            Text("Price: ₹${product.price ?? 0}"),
            Text("Stock: ${product.stock ?? 0}"),
          ],
        ),
      ),
    );
  }
}
