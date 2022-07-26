import 'package:meta/meta.dart';
import 'dart:convert';

List<ReviewModel> reviewModelFromJson(String str) => List<ReviewModel>.from(
    json.decode(str).map((x) => ReviewModel.fromJson(x)));

String reviewModelToJson(List<ReviewModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReviewModel {
  ReviewModel({
    required this.id,
    required this.isActive,
    required this.profile,
    required this.product,
    required this.starCount,
    required this.review,
  });

  int id;
  bool isActive;
  Profile profile;
  Product product;
  int starCount;
  String review;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        id: json["id"],
        isActive: json["is_active"] ?? false,
        profile: Profile.fromJson(json["profile"]),
        product: Product.fromJson(json["product"]),
        starCount: json["star_count"],
        review: json["review"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_active": isActive,
        "profile": profile.toJson(),
        "product": product.toJson(),
        "star_count": starCount,
        "review": review,
      };
}

class Product {
  Product({
    required this.id,
    required this.updatedAt,
    required this.productName,
    required this.featureImage,
  });

  int id;
  DateTime updatedAt;
  String productName;
  String featureImage;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        productName: json["product_name"],
        featureImage: json["feature_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "feature_image": featureImage,
      };
}

class Profile {
  Profile({
    required this.id,
    required this.fullName,
    required this.profilePicture,
  });

  int id;
  String fullName;
  String profilePicture;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        fullName: json["full_name"],
        profilePicture: json["profile_picture"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "profile_picture": profilePicture,
      };
}
