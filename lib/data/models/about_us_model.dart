

class ImageData {
  final String id;
  final String url;

  ImageData({required this.id, required this.url});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      id: json['id'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
    };
  }
}

class AboutUsData {
  final ImageData image;
  final String id;
  final String description;
  final String createdAt;
  final String updatedAt;
  final int v;

  AboutUsData({
    required this.image,
    required this.id,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory AboutUsData.fromJson(Map<String, dynamic> json) {
    return AboutUsData(
      image: ImageData.fromJson(json['image']),
      id: json['_id'],
      description: json['description'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image.toJson(),
      '_id': id,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class AboutUsModel {
  final List<AboutUsData> data;

  AboutUsModel({required this.data});

  factory AboutUsModel.fromJson(Map<String, dynamic> json) {
    return AboutUsModel(
      data: List<AboutUsData>.from(json['data'].map((item) => AboutUsData.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}