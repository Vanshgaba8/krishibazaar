import 'package:flutter/material.dart';
import 'package:krishibazaar/res/color.dart';
import 'package:krishibazaar/screens/Customer/product_detail_page.dart';
import '../../data/product_data.dart';
import '../../models/customer_product_model.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String? selectedCategory; // To store the selected category
  String searchQuery = ''; // To store the search query

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          leading: IconButton(
            icon:
                Icon(Icons.arrow_back, color: Colors.black), // Back button icon
            onPressed: () {
              Navigator.pop(context); // Navigate back when pressed
            },
          ),
          toolbarHeight: 70, // Increase the height for better aesthetics
          elevation: 4, // Add a shadow effect
          backgroundColor:
              Color(0xFFFFF8D8), // Set app bar background color to #FFF8D8
          title: Container(
            decoration: BoxDecoration(
              color:
                  Colors.grey[200], // Light grey background for the search bar
              borderRadius: BorderRadius.circular(30), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black26, // Shadow color
                  blurRadius: 4.0, // Blur radius
                  offset: Offset(0, 2), // Shadow position
                ),
              ],
            ),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value; // Update the search query
                });
              },
              decoration: InputDecoration(
                hintText: 'Search Products',
                border: InputBorder.none, // Remove the border
                prefixIcon:
                    Icon(Icons.search, color: Colors.grey), // Search icon
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0), // Padding for text
              ),
            ),
          ),
        ),
        body: Container(
          color: Color(0xFFFFF8D8), // Set background color to #FFF8D8
          child: Column(
            children: [
              // Category Scrollable List
              Container(
                height: 60,
                color: Color(
                    0xFFFFF8D8), // Set background color for categories to #FFF8D8
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <String>[
                    'All',
                    'Fruits',
                    'Vegetables',
                    'Grains',
                    'Others',
                  ].map((category) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory =
                              category; // Update selected category
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: selectedCategory == category
                              ? Colors.green[400] // Selected category color
                              : Color(
                                  0xFFFFF8D8), // Background color for non-selected categories
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey[300]!, // Light border color
                          ),
                        ),
                        child: Center(
                          child: Text(
                            category,
                            style: TextStyle(
                              color: selectedCategory == category
                                  ? Colors
                                      .white // Text color for selected category
                                  : Colors
                                      .black, // Text color for non-selected categories
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              // Product Grid
              Expanded(
                child: FutureBuilder<List<ProductDataModel>>(
                  future: ProductService.getProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No products available.'));
                    }

                    // Filter the products based on selectedCategory and searchQuery
                    final products = snapshot.data!
                        .where((product) =>
                            (selectedCategory == null ||
                                selectedCategory == 'All' ||
                                product.category == selectedCategory) &&
                            (searchQuery.isEmpty ||
                                product.name
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase())))
                        .toList();

                    if (products.isEmpty) {
                      return Center(
                          child:
                              Text('No products match your search or filter.'));
                    }

                    // Grid View Builder
                    return GridView.builder(
                      padding: const EdgeInsets.all(10.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of items in a row
                        crossAxisSpacing: 10.0, // Space between columns
                        mainAxisSpacing: 10.0, // Space between rows
                        childAspectRatio:
                            0.75, // Aspect ratio for the grid items
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];

                        // Define colors for the grid cards
                        final Color cardColor =
                            Colors.teal[50]!; // Light teal background
                        final Color priceColor =
                            Colors.green[700]!; // Dark green for the price
                        final Color textColor =
                            Colors.black87; // Text color for titles

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailPage(product: product),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.grey[300]!),
                            ),
                            color:
                                cardColor, // Apply the background color to the card
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 120,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10)),
                                    image: DecorationImage(
                                      image: NetworkImage(product.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    product.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: textColor, // Apply text color
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    product.price,
                                    style: TextStyle(
                                      color:
                                          priceColor, // Apply green color for price
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    product.category,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
