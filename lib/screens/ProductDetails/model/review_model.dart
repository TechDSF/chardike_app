import 'dart:convert';

List<ReviewModel> reviewModelFromJson(String str) => List<ReviewModel>.from(
    json.decode(str).map((x) => ReviewModel.fromJson(x)));

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
        starCount: json["star_count"] ?? 0,
        review: json["review"] ?? "",
      );
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
        productName: json["product_name"] ?? "",
        featureImage: json["feature_image"] ?? "",
      );
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
}
