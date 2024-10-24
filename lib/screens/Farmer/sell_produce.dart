import 'package:flutter/material.dart';

class SellProducePage extends StatefulWidget {
  const SellProducePage({super.key});

  @override
  State<SellProducePage> createState() => _SellProducePageState();
}

class _SellProducePageState extends State<SellProducePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String _selectedCategory = 'Fruits'; // Default category
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _submitForm() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    // Collect form data
    String name = _nameController.text;
    String quantity = _quantityController.text;
    String price = _priceController.text;
    String description = _descriptionController.text;
    String category = _selectedCategory;

    // Simulate a delay for API call
    await Future.delayed(const Duration(seconds: 2));

    // Check if fields are filled
    if (name.isEmpty ||
        quantity.isEmpty ||
        price.isEmpty ||
        description.isEmpty ||
        category.isEmpty) {
      setState(() {
        _errorMessage = 'Please fill all fields';
        _isLoading = false;
      });
      return;
    }

    // Here, you would normally send the data to your backend/API
    // For now, let's just clear the fields
    _nameController.clear();
    _quantityController.clear();
    _priceController.clear();
    _descriptionController.clear();
    setState(() {
      _selectedCategory = 'Fruits'; // Reset category after submission
    });

    setState(() {
      _isLoading = false;
    });

    // Show a success message (you could use a SnackBar instead)
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: const Text('Produce listed successfully!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8D8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8D8),
        title: const Text(
          'Sell Your Produce',
          style: TextStyle(color: Colors.brown),
        ),
        iconTheme: const IconThemeData(color: Colors.brown),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Produce Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantity (kg)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Price (₹ per kg)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                items: ['Fruits', 'Vegetables', 'Grains', 'Others']
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.green, // Button background color
                      ),
                      child: const Text(
                        'List Produce',
                        style:
                            TextStyle(color: Colors.white), // Button text color
                      ),
                    ),
              const SizedBox(height: 20),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
