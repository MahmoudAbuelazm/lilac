
class ContactUsModel {
  List<Data> data;

  ContactUsModel({required this.data});

  factory ContactUsModel.fromJson(Map<String, dynamic> json) {
    return ContactUsModel(
      data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}

class Data {
  SocialLinks socialLinks;
  String id;
  String email;
  String address;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Data({
    required this.socialLinks,
    required this.id,
    required this.email,
    required this.address,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      socialLinks: SocialLinks.fromJson(json['socialLinks']),
      id: json['_id'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'socialLinks': socialLinks.toJson(),
      '_id': id,
      'email': email,
      'address': address,
      'phone': phone,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

class SocialLinks {
  String facebook;
  String instagram;
  String twitter;
  String linkedIn;
  String youtube;

  SocialLinks({
    required this.facebook,
    required this.instagram,
    required this.twitter,
    required this.linkedIn,
    required this.youtube,
  });

  factory SocialLinks.fromJson(Map<String, dynamic> json) {
    return SocialLinks(
      facebook: json['facebook'],
      instagram: json['instagram'],
      twitter: json['twitter'],
      linkedIn: json['linkedIn'],
      youtube: json['youtube'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'facebook': facebook,
      'instagram': instagram,
      'twitter': twitter,
      'linkedIn': linkedIn,
      'youtube': youtube,
    };
  }
}