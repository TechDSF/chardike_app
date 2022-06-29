// To parse this JSON data, do
//
//     final productModel = productModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ProductModel> productModelFromMap(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromMap(x)));

String productModelToMap(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ProductModel {
  ProductModel({
    required this.id,
    required this.brand,
    required this.country,
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
  int brand;
  int country;
  String category;
  String subCategory;
  String productName;
  String slug;
  String meta;
  String shortDescriptions;
  String longDescription;
  String alterText;
  String featureImage;
  List<ProductImage> productImage;
  dynamic soldCount;
  dynamic expireRate;
  bool isStock;
  List<Variant> variant;
  List<Review> reviews;

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        brand: json["brand"],
        country: json["country"],
        category: json["category"],
        subCategory: json["sub_category"],
        productName: json["product_name"],
        slug: json["slug"],
        meta: json["meta"],
        shortDescriptions: json["short_descriptions"],
        longDescription: json["long_description"],
        alterText: json["alter_text"],
        featureImage: json["feature_image"],
        productImage: List<ProductImage>.from(
            json["product_image"].map((x) => ProductImage.fromMap(x))),
        soldCount: json["sold_count"],
        expireRate: json["expire_rate"],
        isStock: json["is_stock"],
        variant:
            List<Variant>.from(json["variant"].map((x) => Variant.fromMap(x))),
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "brand": brand,
        "country": country,
        "category": category,
        "sub_category": subCategory,
        "product_name": productName,
        "slug": slug,
        "meta": meta,
        "short_descriptions": shortDescriptions,
        "long_description": longDescription,
        "alter_text": alterText,
        "feature_image": featureImage,
        "product_image": List<dynamic>.from(productImage.map((x) => x.toMap())),
        "sold_count": soldCount,
        "expire_rate": expireRate,
        "is_stock": isStock,
        "variant": List<dynamic>.from(variant.map((x) => x.toMap())),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toMap())),
      };
}

class ProductImage {
  ProductImage({
    required this.image,
  });

  String image;

  factory ProductImage.fromMap(Map<String, dynamic> json) => ProductImage(
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "image": image,
      };
}

class Review {
  Review({
    required this.id,
    required this.profile,
    required this.product,
    required this.starCount,
    required this.review,
  });

  int id;
  String profile;
  String product;
  int starCount;
  String review;

  factory Review.fromMap(Map<String, dynamic> json) => Review(
        id: json["id"],
        profile: json["profile"],
        product: json["product"],
        starCount: json["star_count"],
        review: json["review"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "profile": profile,
        "product": product,
        "star_count": starCount,
        "review": review,
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

  factory Variant.fromMap(Map<String, dynamic> json) => Variant(
        id: json["id"],
        product: json["product"],
        size: json["size"],
        color: json["color"],
        weight: json["weight"],
        regularPrice: json["regular_price"],
        sellingPrice: json["selling_price"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "product": product,
        "size": size,
        "color": color,
        "weight": weight,
        "regular_price": regularPrice,
        "selling_price": sellingPrice,
      };
}
