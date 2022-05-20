// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel2 categoryModelFromJson(String str) => CategoryModel2.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel2 data) => json.encode(data.toJson());

class CategoryModel2 {
  CategoryModel2({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  factory CategoryModel2.fromJson(Map<String, dynamic> json) => CategoryModel2(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.id,
    required this.image,
    required this.categoryName,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryCode,
    required this.isActive,
  });

  int id;
  String image;
  String categoryName;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;
  String categoryCode;
  bool isActive;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    image: json["image"],
    categoryName: json["category_name"],
    slug: json["slug"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    categoryCode: json["category_code"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "category_name": categoryName,
    "slug": slug,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "category_code": categoryCode,
    "is_active": isActive,
  };
}
