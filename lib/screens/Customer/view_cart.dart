import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String price;
  int quantity;

  CartItem({required this.name, required this.price, this.quantity = 1});
}

class ViewCartPage extends StatefulWidget {
  @override
  _ViewCartPageState createState() => _ViewCartPageState();
}

class _ViewCartPageState extends State<ViewCartPage> {
  // Placeholder for cart items
  List<CartItem> cartItems = [
    CartItem(name: 'Tomato', price: 'Rs. 80.00', quantity: 1),
    CartItem(name: 'Potato', price: 'Rs. 20.00', quantity: 2),
    CartItem(name: 'Onion', price: 'Rs 150.00', quantity: 1),
  ];

  // Method to update item quantity
  void updateQuantity(CartItem item, int change) {
    setState(() {
      item.quantity += change;
      if (item.quantity < 1) item.quantity = 1;
    });
  }

  // Method to remove an item
  void removeItem(CartItem item) {
    setState(() {
      cartItems.remove(item);
    });
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
            child: ListView.builder(
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
                        child:
                            Text(item.name[0]), // Placeholder for product image
                      ),
                      title: Text(item.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.price,
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
            ),
          ),
          // Checkout Button at the bottom
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
