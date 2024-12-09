import 'package:flutter/material.dart';
import 'package:krishibazaar/utils/routes/routes_name.dart';
import 'package:krishibazaar/view_model/category_view_model.dart';
import 'package:krishibazaar/view_model/product_view_model.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All'; // Default to "All"

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryViewModel>().fetchCategories(context);
      context.read<ProductViewModel>().fetchProducts(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search Products...',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {}); // Update UI on search input change
          },
        ),
      ),
      body: Column(
        children: [
          Consumer<CategoryViewModel>(
            builder: (context, categoryViewModel, child) {
              if (categoryViewModel.loading) {
                return const LinearProgressIndicator();
              }
              final categories = [
                'All',
                ...categoryViewModel.categoryMap.values,
              ];

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ChoiceChip(
                        label: Text(category),
                        selected: _selectedCategory == category,
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = selected ? category : 'All';
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
          Expanded(
            child: Consumer<ProductViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (viewModel.errorMessage != null) {
                  return Center(child: Text(viewModel.errorMessage!));
                }

                if (viewModel.productModel != null) {
                  List<Products> products =
                      viewModel.productModel!.products ?? [];

                  if (_searchController.text.isNotEmpty) {
                    products = products.where((product) {
                      return product.name
                              ?.toLowerCase()
                              .contains(_searchController.text.toLowerCase()) ??
                          false;
                    }).toList();
                  }

                  if (_selectedCategory.isNotEmpty &&
                      _selectedCategory != 'All') {
                    products = products.where((product) {
                      final categoryName = context
                          .watch<CategoryViewModel>()
                          .categoryMap[product.category];
                      return categoryName == _selectedCategory;
                    }).toList();
                  }

                  if (products.isEmpty) {
                    return const Center(
                      child: Text(
                        "No products available for the selected filters.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    );
                  }

                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      final categoryName = context
                              .watch<CategoryViewModel>()
                              .categoryMap[product.category] ??
                          'Unknown';
                      String imageUrl = product.images?.isNotEmpty == true
                          ? product.images![0].url ?? ''
                          : 'https://www.example.com/placeholder-image.jpg';

                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesName.productDetailView,
                              arguments: product);
                        },
                        child: Card(
                          elevation: 4.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                imageUrl,
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  product.name ?? 'Unnamed Product',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'Category: $categoryName',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  '₹${product.price ?? 0}/Kg',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }

                return const Center(child: Text("No products available"));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ProductViewModel>().fetchProducts(context);
          context.read<CategoryViewModel>().fetchCategories(context);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
