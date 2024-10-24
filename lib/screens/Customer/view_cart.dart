import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({required this.name, required this.price, this.quantity = 1});

  // Method to calculate total price for this item
  double get totalPrice => price * quantity;
}

class ViewCartPage extends StatefulWidget {
  @override
  _ViewCartPageState createState() => _ViewCartPageState();
}

class _ViewCartPageState extends State<ViewCartPage> {
  // Placeholder for cart items
  List<CartItem> cartItems = [
    CartItem(name: 'Tomato', price: 80.00, quantity: 1),
    CartItem(name: 'Potato', price: 20.00, quantity: 2),
    CartItem(name: 'Onion', price: 150.00, quantity: 1),
  ];

  // Method to update item quantity
  void updateQuantity(CartItem item, int change) {
    setState(() {
      item.quantity += change;
      if (item.quantity < 1) item.quantity = 1; // Ensure quantity is at least 1
    });
  }

  // Method to remove an item
  void removeItem(CartItem item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  // Method to calculate the total payable amount
  double calculateTotalPayable() {
    return cartItems.fold(0, (total, item) => total + item.totalPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Cart'),
        backgroundColor: const Color(0xFFFFF8D8), // Consistent color with theme
      ),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isNotEmpty
                ? ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Card(
                          elevation: 2,
                          child: ListTile(
                            focusColor: const Color(0xFFFFF8D8),
                            leading: CircleAvatar(
                              backgroundColor: Color(0xFFFFF8D8),
                              child: Text(item
                                  .name[0]), // Placeholder for product image
                            ),
                            title: Text(item.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Display the total price for this item based on quantity
                                Text(
                                    'Rs. ${item.totalPrice.toStringAsFixed(2)}',
                                    style: TextStyle(color: Colors.green)),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () => updateQuantity(item, -1),
                                    ),
                                    Text('${item.quantity}'),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () => updateQuantity(item, 1),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => removeItem(item),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      'Your cart is empty!',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
          // Total Payable Amount
          if (cartItems.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Payable:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rs. ${calculateTotalPayable().toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
          // Checkout Button at the bottom
          if (cartItems.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle checkout logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Proceeding to checkout...',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
                child: Text(
                  'Proceed to Checkout',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Button background color
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
