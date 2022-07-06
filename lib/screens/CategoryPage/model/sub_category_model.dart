// To parse this JSON data, do
//
//     final subCategoryModel = subCategoryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<SubCategoryModel> subCategoryModelFromJson(String str) =>
    List<SubCategoryModel>.from(
        json.decode(str).map((x) => SubCategoryModel.fromJson(x)));

String subCategoryModelToJson(List<SubCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategoryModel {
  SubCategoryModel({
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

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryModel(
        id: json["id"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        subCategoryName: json["sub_category_name"],
        slug: json["slug"],
        description: json["description"],
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

class Category {
  Category({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.categoryName,
    required this.slug,
    required this.image,
    required this.categoryCode,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  String categoryName;
  String slug;
  String image;
  String categoryCode;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        categoryName: json["category_name"],
        slug: json["slug"],
        image: json["image"],
        categoryCode: json["category_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "category_name": categoryName,
        "slug": slug,
        "image": image,
        "category_code": categoryCode,
      };
}
