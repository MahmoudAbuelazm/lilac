class Video {
  final String url;
  final String id;

  Video({
    required this.url,
    required this.id,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
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

class Result {
  final Video video;
  final String id;
  final String name;
  final String slug;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Result({
    required this.video,
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      video: Video.fromJson(json['img']),
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'video': video.toJson(),
      '_id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

class ServiceModel {
  final bool success;
  final List<Result> results;

  ServiceModel({
    required this.success,
    required this.results,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      success: json['success'],
      results:
          List<Result>.from(json['results'].map((x) => Result.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'results': List<dynamic>.from(results.map((x) => x.toJson())),
    };
  }
}
