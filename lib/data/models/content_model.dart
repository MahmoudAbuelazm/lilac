
class ImageData {
  final String url;
  final String id;

  ImageData({required this.url, required this.id});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      url: json['url'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'id': id,
    };
  }
}

class Data {
  final ImageData landingPageImage;
  final ImageData logo;
  final String id;
  final String title;
  final String landingPageText;
  final String createdAt;
  final String updatedAt;
  final int v;

  Data({
    required this.landingPageImage,
    required this.logo,
    required this.id,
    required this.title,
    required this.landingPageText,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      landingPageImage: ImageData.fromJson(json['landingPageImage']),
      logo: ImageData.fromJson(json['logo']),
      id: json['_id'],
      title: json['title'],
      landingPageText: json['landingPageText'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'landingPageImage': landingPageImage.toJson(),
      'logo': logo.toJson(),
      '_id': id,
      'title': title,
      'landingPageText': landingPageText,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class ResponseModel {
  final Data data;

  ResponseModel({required this.data});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}