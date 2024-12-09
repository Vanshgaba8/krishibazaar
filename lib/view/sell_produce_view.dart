import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:krishibazaar/res/color.dart';
import 'package:provider/provider.dart';

import 'package:krishibazaar/utils/utils.dart';

import '../view_model/sell_produce_view_model.dart';

class SellProducePage extends StatefulWidget {
  @override
  _SellProducePageState createState() => _SellProducePageState();
}

class _SellProducePageState extends State<SellProducePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _newCategoryController = TextEditingController();

  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    final sellProduceModel =
        Provider.of<SellProduceModel>(context, listen: false);
    sellProduceModel.fetchCategories(context);
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // Show the dialog to add a new category
  Future<void> _showAddCategoryDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add New Category"),
          content: TextField(
            controller: _newCategoryController,
            decoration: const InputDecoration(labelText: "Category Name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                final newCategory = _newCategoryController.text;
                if (newCategory.isNotEmpty) {
                  // Add the new category to the list
                  final sellProduceModel =
                      Provider.of<SellProduceModel>(context, listen: false);
                  sellProduceModel.addCategory(newCategory, context);

                  // Clear the input and close the dialog
                  _newCategoryController.clear();
                  Navigator.pop(context);
                } else {
                  Utils.showErrorMessage(
                      "Please enter a category name", context);
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final sellProduceModel = Provider.of<SellProduceModel>(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: const Text("Sell Produce"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Product Name"),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: sellProduceModel.selectedCategory,
                items: [
                  ...sellProduceModel.categories
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          ))
                      .toList(),
                  DropdownMenuItem(
                    value: 'add_new_category',
                    child: Text("Add New Category"),
                  ),
                ],
                onChanged: (value) {
                  if (value == 'add_new_category') {
                    _showAddCategoryDialog();
                  } else {
                    sellProduceModel.selectedCategory = value;
                  }
                },
                decoration: const InputDecoration(labelText: "Category"),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _quantityController,
                decoration: const InputDecoration(labelText: "Stock (in Kg)"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _priceController,
                decoration:
                    const InputDecoration(labelText: "Price(Rs per kg)"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _descriptionController,
                decoration:
                    const InputDecoration(labelText: "Product Description"),
                maxLines: 3,
              ),
              const SizedBox(height: 16.0),
              if (_selectedImage != null)
                Image.file(
                  _selectedImage!,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                )
              else
                const Text("No image selected"),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text("Upload Image"),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Manual validation
                  if (_nameController.text.isEmpty) {
                    Utils.showErrorMessage(
                        "Please enter a product name", context);
                    return;
                  }
                  if (sellProduceModel.selectedCategory == null) {
                    Utils.showErrorMessage("Please select a category", context);
                    return;
                  }
                  if (_quantityController.text.isEmpty) {
                    Utils.showErrorMessage("Please enter stock", context);
                    return;
                  }
                  if (_priceController.text.isEmpty) {
                    Utils.showErrorMessage("Please enter a price", context);
                    return;
                  }
                  if (_descriptionController.text.isEmpty) {
                    Utils.showErrorMessage(
                        "Please enter a description", context);
                    return;
                  }
                  if (_selectedImage == null) {
                    Utils.showErrorMessage("Please upload an image", context);
                    return;
                  }

                  sellProduceModel.addProduct(
                    _nameController.text,
                    _quantityController.text,
                    _priceController.text,
                    _descriptionController.text,
                    _selectedImage,
                    context,
                  );
                },
                child: const Text("Submit"),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
