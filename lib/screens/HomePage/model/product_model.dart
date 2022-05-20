// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductResult productModelFromJson(String str) => ProductResult.fromJson(json.decode(str));

String productModelToJson(ProductResult data) => json.encode(data.toJson());

class ProductResult {
  ProductResult({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<ProductModel> results;

  factory ProductResult.fromJson(Map<String, dynamic> json) => ProductResult(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<ProductModel>.from(json["results"].map((x) => ProductModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class ProductModel {
  ProductModel({
    required this.id,
    required this.brand,
    required this.country,
    required this.name,
    required this.slug,
    required this.meta,
    required this.descriptions,
    this.alterText,
    required this.featureImage,
    required this.oldPrice,
    required this.newPrice,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int brand;
  int country;
  String name;
  String slug;
  String meta;
  String descriptions;
  dynamic alterText;
  String featureImage;
  String oldPrice;
  String newPrice;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    brand: json["brand"],
    country: json["country"],
    name: json["name"],
    slug: json["slug"],
    meta: json["meta"],
    descriptions: json["descriptions"],
    alterText: json["alter_text"],
    featureImage: json["feature_image"],
    oldPrice: json["old_price"],
    newPrice: json["New_price"],
    isActive: json["is_active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "brand": brand,
    "country": country,
    "name": name,
    "slug": slug,
    "meta": meta,
    "descriptions": descriptions,
    "alter_text": alterText,
    "feature_image": featureImage,
    "old_price": oldPrice,
    "New_price": newPrice,
    "is_active": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
  };
}

class ProductBrand {
  ProductBrand({
    required this.id,
    required this.name,
    required this.brandWebsite,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String brandWebsite;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProductBrand.fromJson(Map<String, dynamic> json) => ProductBrand(
    id: json["id"],
    name: json["name"],
    brandWebsite: json["brand_website"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "brand_website": brandWebsite,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class ProductCategory {
  ProductCategory({
    required this.id,
    required this.categoryName,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryCode,
    required this.isActive,
  });

  int id;
  String categoryName;
  String slug;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  String categoryCode;
  bool isActive;

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
    id: json["id"],
    categoryName: json["category_name"],
    slug: json["slug"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    categoryCode: json["category_code"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "slug": slug,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "category_code": categoryCode,
    "is_active": isActive,
  };
}




class ProductCountry {
  ProductCountry({
    required this.id,
    required this.name,
    required this.description,
  });

  int id;
  String name;
  String description;

  factory ProductCountry.fromJson(Map<String, dynamic> json) => ProductCountry(
    id: json["id"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
  };
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.subCategoryName,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
    required this.isActive,
    required this.category,
  });

  int id;
  String subCategoryName;
  String slug;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  String description;
  bool isActive;
  ProductCategory category;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["id"],
    subCategoryName: json["sub_category_name"],
    slug: json["slug"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    description: json["description"],
    isActive: json["is_active"],
    category: ProductCategory.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sub_category_name": subCategoryName,
    "slug": slug,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "description": description,
    "is_active": isActive,
    "category": category.toJson(),
  };
}

