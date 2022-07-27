// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
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
  dynamic categoryName;
  dynamic slug;
  dynamic categoryCode;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        image: json["image"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        categoryName: json["category_name"],
        slug: json["slug"],
        categoryCode: json["category_code"],
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
