// To parse this JSON data, do
//
//     final queryProductModel = queryProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<QueryProductModel> queryProductModelFromJson(String str) =>
    List<QueryProductModel>.from(
        json.decode(str).map((x) => QueryProductModel.fromJson(x)));

String queryProductModelToJson(List<QueryProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QueryProductModel {
  QueryProductModel({
    required this.id,
    required this.brand,
    required this.country,
    required this.subCategory,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.productName,
    required this.slug,
    required this.meta,
    required this.shortDescriptions,
    required this.longDescription,
    required this.alterText,
    required this.sku,
    required this.upc,
    required this.featureImage,
    required this.regularPrice,
    required this.newPrice,
    required this.inventory,
    required this.isStock,
  });

  int id;
  String brand;
  String country;
  String subCategory;
  String category;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  String productName;
  String slug;
  String meta;
  String shortDescriptions;
  dynamic longDescription;
  String alterText;
  String sku;
  String upc;
  String featureImage;
  String regularPrice;
  String newPrice;
  int inventory;
  bool isStock;

  factory QueryProductModel.fromJson(Map<String, dynamic> json) =>
      QueryProductModel(
        id: json["id"],
        brand: json["brand"],
        country: json["country"],
        subCategory: json["sub_category"],
        category: json["category"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        productName: json["product_name"],
        slug: json["slug"],
        meta: json["meta"],
        shortDescriptions: json["short_descriptions"],
        longDescription: json["long_description"],
        alterText: json["alter_text"],
        sku: json["sku"],
        upc: json["upc"],
        featureImage: json["feature_image"],
        regularPrice: json["regular_price"],
        newPrice: json["new_price"],
        inventory: json["inventory"],
        isStock: json["is_stock"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "country": country,
        "sub_category": subCategory,
        "category": category,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "product_name": productName,
        "slug": slug,
        "meta": meta,
        "short_descriptions": shortDescriptions,
        "long_description": longDescription,
        "alter_text": alterText,
        "sku": sku,
        "upc": upc,
        "feature_image": featureImage,
        "regular_price": regularPrice,
        "new_price": newPrice,
        "inventory": inventory,
        "is_stock": isStock,
      };
}
