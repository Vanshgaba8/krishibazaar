class ProductModel {
  bool? success;
  String? message;
  int? totalProducts;
  List<Products>? products;

  ProductModel({this.success, this.message, this.totalProducts, this.products});

  ProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    totalProducts = json['totalProducts'];

    if (json['products'] != null && json['products'] is List) {
      products =
          (json['products'] as List).map((v) => Products.fromJson(v)).toList();
    } else {
      products = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['totalProducts'] = totalProducts;

    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? id;
  String? name;
  String? description;
  int? price;
  int? stock;
  int? userQuantity;
  String? category;
  List<Images>? images;
  int? rating;
  int? numReviews;
  List<dynamic>? reviews; // Use dynamic for now to avoid mapping errors
  String? createdAt;
  String? updatedAt;
  int? iV;

  Products({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stock,
    this.userQuantity,
    this.category,
    this.images,
    this.rating,
    this.numReviews,
    this.reviews,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stock = json['stock'];
    userQuantity = json['userQuantity'];
    category = json['category'];

    if (json['images'] != null && json['images'] is List) {
      images = (json['images'] as List).map((v) => Images.fromJson(v)).toList();
    } else {
      images = [];
    }

    rating = json['rating'];
    numReviews = json['numReviews'];

    if (json['reviews'] != null && json['reviews'] is List) {
      reviews =
          json['reviews']; // Keeping it dynamic unless specifics are known
    } else {
      reviews = [];
    }

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['stock'] = stock;
    data['userQuantity'] = userQuantity;
    data['category'] = category;

    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }

    data['rating'] = rating;
    data['numReviews'] = numReviews;

    if (reviews != null) {
      data['reviews'] = reviews; // Assuming no nested mapping for reviews
    }

    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Images {
  String? publicId;
  String? url;
  String? id;

  Images({this.publicId, this.url, this.id});

  Images.fromJson(Map<String, dynamic> json) {
    publicId = json['public_id'];
    url = json['url'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['public_id'] = publicId;
    data['url'] = url;
    data['_id'] = id;
    return data;
  }
}
