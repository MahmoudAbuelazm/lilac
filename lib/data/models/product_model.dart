class ProductModel {
  bool success;
  List<Product> result;

  ProductModel({required this.success, required this.result});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      success: json['success'],
      result: List<Product>.from(json['result'].map((x) => Product.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'result': List<dynamic>.from(result.map((x) => x.toJson())),
    };
  }
}

class Product {
  String id;
  String name;
  String description;
  List<ImageModel> image;
  int price;
  int discount;
  String cloudFolder;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String finalPrice;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.discount,
    required this.cloudFolder,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.finalPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      image: List<ImageModel>.from(json['image'].map((x) => ImageModel.fromJson(x))),
      price: json['price'],
      discount: json['discount'],
      cloudFolder: json['cloudFolder'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
      finalPrice: json['finalPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'image': List<dynamic>.from(image.map((x) => x.toJson())),
      'price': price,
      'discount': discount,
      'cloudFolder': cloudFolder,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
      'finalPrice': finalPrice,
    };
  }
}

class ImageModel {
  String url;
  String id;
  String imageId;

  ImageModel({required this.url, required this.id, required this.imageId});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      url: json['url'],
      id: json['id'],
      imageId: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'id': id,
      '_id': imageId,
    };
  }
}