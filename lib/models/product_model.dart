class ProductModel {
  String? sId;
  String? name;
  String? description;
  int? price;
  int? stock;
  int? userQuantity;
  String? category;
  List<Images>? images;
  int? rating;
  int? numReviews;
  List<dynamic>?
      reviews; // Updated to handle dynamic types or specify the type if known.
  String? createdAt;
  String? updatedAt;
  int? version; // Renamed from iV to version for better clarity.

  ProductModel({
    this.sId,
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
    this.version,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stock = json['stock'];
    userQuantity = json['userQuantity'];
    category = json['category'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    rating = json['rating'];
    numReviews = json['numReviews'];
    if (json['reviews'] != null) {
      reviews = List<dynamic>.from(
          json['reviews']); // Handles dynamic content in reviews.
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    version = json['__v']; // Adjusted variable name.
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
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
      data['reviews'] =
          reviews; // No transformation needed if reviews are dynamic.
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = version; // Adjusted variable name.
    return data;
  }
}

class Images {
  String? publicId;
  String? url;
  String? sId;

  Images({this.publicId, this.url, this.sId});

  Images.fromJson(Map<String, dynamic> json) {
    publicId = json['public_id'];
    url = json['url'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['public_id'] = publicId;
    data['url'] = url;
    data['_id'] = sId;
    return data;
  }
}
