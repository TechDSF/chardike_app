// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    required this.id,
    required this.brand,
    required this.country,
    required this.sku,
    required this.category,
    required this.subCategory,
    required this.productName,
    required this.slug,
    required this.meta,
    required this.shortDescriptions,
    required this.longDescription,
    required this.alterText,
    required this.featureImage,
    required this.productImage,
    required this.soldCount,
    required this.expireRate,
    required this.isStock,
    required this.variant,
    required this.reviews,
  });

  int id;
  Brand brand;
  Brand country;
  String sku;
  List<Category> category;
  List<SubCategory> subCategory;
  String productName;
  String slug;
  String meta;
  String shortDescriptions;
  String longDescription;
  String alterText;
  String featureImage;
  List<ProductImage> productImage;
  dynamic soldCount;
  DateTime expireRate;
  bool isStock;
  List<Variant> variant;
  List<Review> reviews;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        brand: Brand.fromJson(json["brand"]),
        country: Brand.fromJson(json["country"]),
        sku: json["sku"] ?? "Product sku null",
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        subCategory: List<SubCategory>.from(
            json["sub_category"].map((x) => SubCategory.fromJson(x))),
        productName: json["product_name"],
        slug: json["slug"],
        meta: json["meta"],
        shortDescriptions: json["short_descriptions"] ?? "",
        longDescription: json["long_description"] ?? "",
        alterText: json["alter_text"] ?? "empty",
        featureImage: json["feature_image"] ?? "image null",
        productImage: List<ProductImage>.from(
            json["product_image"].map((x) => ProductImage.fromJson(x))),
        soldCount: json["sold_count"],
        expireRate: DateTime.parse(json["expire_rate"]),
        isStock: json["is_stock"],
        variant:
            List<Variant>.from(json["variant"].map((x) => Variant.fromJson(x))),
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "country": country.toJson(),
        "sku": sku,
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "sub_category": List<dynamic>.from(subCategory.map((x) => x.toJson())),
        "product_name": productName,
        "slug": slug,
        "meta": meta,
        "short_descriptions": shortDescriptions,
        "long_description": longDescription,
        "alter_text": alterText,
        "feature_image": featureImage,
        "product_image":
            List<dynamic>.from(productImage.map((x) => x.toJson())),
        "sold_count": soldCount,
        "expire_rate":
            "${expireRate.year.toString().padLeft(4, '0')}-${expireRate.month.toString().padLeft(2, '0')}-${expireRate.day.toString().padLeft(2, '0')}",
        "is_stock": isStock,
        "variant": List<dynamic>.from(variant.map((x) => x.toJson())),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
      };
}

class Brand {
  Brand({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.name,
    required this.brandWebsite,
    required this.description,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  String name;
  String brandWebsite;
  String description;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        name: json["name"] ?? "brand is null",
        brandWebsite:
            json["brand_website"] == null ? "null" : json["brand_website"],
        description: json["description"] ?? "brand description null",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "name": name,
        "brand_website": brandWebsite == null ? null : brandWebsite,
        "description": description,
      };
}

class Category {
  Category({
    required this.id,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.categoryName,
    required this.slug,
    required this.categoryCode,
  });

  int id;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  String categoryName;
  String slug;
  String categoryCode;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        image: json["image"] ?? "category image null",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        categoryName: json["category_name"] ?? "category name null",
        slug: json["slug"] ?? "category slug null",
        categoryCode: json["category_code"] ?? "category code null",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "category_name": categoryName,
        "slug": slug,
        "category_code": categoryCode,
      };
}

class ProductImage {
  ProductImage({
    required this.image,
  });

  String image;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        image: json["image"] ?? "product image null",
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}

class Review {
  Review({
    required this.id,
    required this.isActive,
    required this.profile,
    required this.product,
    required this.starCount,
    required this.review,
  });

  int id;
  bool isActive;
  String profile;
  String product;
  int starCount;
  String review;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        isActive: json["is_active"],
        profile: json["profile"] ?? "",
        product: json["product"] ?? "review product null",
        starCount: json["star_count"],
        review: json["review"] ?? "No Comment",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_active": isActive,
        "profile": profile,
        "product": product,
        "star_count": starCount,
        "review": review,
      };
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.subCategoryName,
    required this.slug,
    required this.description,
    required this.category,
  });

  int id;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  String subCategoryName;
  String slug;
  String description;
  Category category;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        image: json["image"] ?? "null",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        subCategoryName: json["sub_category_name"] ?? "sub category null",
        slug: json["slug"] ?? "null",
        description: json["description"] ?? "null",
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "sub_category_name": subCategoryName,
        "slug": slug,
        "description": description,
        "category": category.toJson(),
      };
}

class Variant {
  Variant({
    required this.id,
    required this.product,
    required this.size,
    required this.color,
    required this.weight,
    required this.regularPrice,
    required this.sellingPrice,
  });

  int id;
  String product;
  String size;
  String color;
  String weight;
  double regularPrice;
  double sellingPrice;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        product: json["product"] ?? "null",
        size: json["size"] == null ? "null" : json["size"],
        color: json["color"] == null ? "null" : json["color"],
        weight: json["weight"] == null ? "null" : json["weight"],
        regularPrice: json["regular_price"],
        sellingPrice: json["selling_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product,
        "size": size == null ? "null" : size,
        "color": color == null ? "null" : color,
        "weight": weight == null ? "null" : weight,
        "regular_price": regularPrice,
        "selling_price": sellingPrice,
      };
}
