import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:krishibazaar/utils/utils.dart';

import '../res/components/product_card.dart';
import '../view_model/product_view_model.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: Consumer<ProductViewModel>(
        builder: (context, productViewModel, child) {
          if (productViewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          // Show error message if any
          if (productViewModel.errorMessage != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Utils.showErrorMessage(productViewModel.errorMessage!, context);
            });
          }

          if (productViewModel.products.isEmpty) {
            return Center(child: Text('No products available'));
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: productViewModel.products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: productViewModel.products[index]);
            },
          );
        },
      ),
    );
  }
}
