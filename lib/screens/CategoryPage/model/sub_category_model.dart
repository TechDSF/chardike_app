import 'package:chardike/screens/CategoryPage/model/category_model.dart';
import 'dart:convert';

List<SubCategoryModel> subCategoryModelFromJson(String str) =>
    List<SubCategoryModel>.from(
        json.decode(str).map((x) => SubCategoryModel.fromJson(x)));

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
  CategoryModel category;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryModel(
        id: json["id"],
        image: json["image"] ??
            "https://upload.wikimedia.org/wikipedia/commons/3/3f/Placeholder_view_vector.svg",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"] ?? false,
        subCategoryName: json["sub_category_name"] ?? "",
        slug: json["slug"] ?? "",
        description: json["description"] ?? "",
        category: CategoryModel.fromJson(json["category"]),
      );
}
