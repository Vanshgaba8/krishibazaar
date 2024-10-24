class ProductDataModel {
  final String id;
  final String name;
  final String description;
  final String price;
  final String imageUrl;
  final String category; // Add category field

  ProductDataModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category, // Initialize category
  });
}
