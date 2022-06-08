// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);
import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    required this.id,
    required this.productImage,
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
    required this.brand,
    required this.country,
    required this.category,
    required this.subCategory,
  });

  int id;
  List<ProductImage> productImage;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  String productName;
  String slug;
  dynamic meta;
  dynamic shortDescriptions;
  dynamic longDescription;
  dynamic alterText;
  String sku;
  String upc;
  String featureImage;
  String regularPrice;
  String newPrice;
  int inventory;
  bool isStock;
  int brand;
  int country;
  List<int> category;
  List<int> subCategory;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    productImage: List<ProductImage>.from(json["product_image"].map((x) => ProductImage.fromJson(x))),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isActive: json["is_active"]??false,
    productName: json["product_name"],
    slug: json["slug"]??"",
    meta: json["meta"]??"",
    shortDescriptions: json["short_descriptions"]??"",
    longDescription: json["long_description"]??"",
    alterText: json["alter_text"]??"",
    sku: json["sku"]??"",
    upc: json["upc"]??"",
    featureImage: json["feature_image"],
    regularPrice: json["regular_price"]??"",
    newPrice: json["new_price"]??"",
    inventory: json["inventory"]??0,
    isStock: json["is_stock"]??false,
    brand: json["brand"]??0,
    country: json["country"],
    category: List<int>.from(json["category"].map((x) => x)),
    subCategory: List<int>.from(json["sub_category"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_image": List<dynamic>.from(productImage.map((x) => x.toJson())),
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
    "brand": brand,
    "country": country,
    "category": List<dynamic>.from(category.map((x) => x)),
    "sub_category": List<dynamic>.from(subCategory.map((x) => x)),
  };
}

class ProductImage {
  ProductImage({
    required this.image,
  });

  String image;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
  };
}
