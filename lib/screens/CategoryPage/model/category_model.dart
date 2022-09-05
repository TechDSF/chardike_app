import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

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
        isActive: json["is_active"] ?? false,
        categoryName: json["category_name"] ?? "",
        slug: json["slug"] ?? "",
        categoryCode: json["category_code"] ?? "",
      );
}
