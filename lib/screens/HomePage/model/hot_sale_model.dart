// To parse this JSON data, do
//
//     final hotSale = hotSaleFromJson(jsonString);

import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

List<HotSale> hotSaleFromJson(String str) =>
    List<HotSale>.from(json.decode(str).map((x) => HotSale.fromJson(x)));

class HotSale {
  HotSale({
    required this.items,
  });

  List<ItemElement> items;

  factory HotSale.fromJson(Map<String, dynamic> json) => HotSale(
        items: List<ItemElement>.from(
            json["items"].map((x) => ItemElement.fromJson(x))),
      );
}

class ItemElement {
  ItemElement({
    required this.item,
  });

  HotSaleItem item;

  factory ItemElement.fromJson(Map<String, dynamic> json) => ItemElement(
        item: HotSaleItem.fromJson(json["item"]),
      );
}

class HotSaleItem {
  HotSaleItem({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.productName,
    required this.slug,
    required this.meta,
    required this.shortDescriptions,
    required this.longDescription,
    required this.alterText,
    required this.tags,
    required this.sku,
    required this.featureImage,
    required this.regularPrice,
    required this.sellingPrice,
    required this.stockCount,
    required this.soldCount,
    required this.expireDate,
    required this.isStock,
    required this.brand,
    required this.country,
    required this.category,
    required this.subCategory,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  String productName;
  String slug;
  String meta;
  String shortDescriptions;
  String longDescription;
  String alterText;
  String tags;
  String sku;
  String featureImage;
  String regularPrice;
  String sellingPrice;
  int stockCount;
  int soldCount;
  DateTime expireDate;
  bool isStock;
  Brand brand;
  Brand country;
  List<Category> category;
  List<SubCategory> subCategory;

  factory HotSaleItem.fromJson(Map<String, dynamic> json) => HotSaleItem(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        productName: json["product_name"],
        slug: json["slug"],
        meta: json["meta"],
        shortDescriptions: json["short_descriptions"],
        longDescription: json["long_description"],
        alterText: json["alter_text"],
        tags: json["tags"],
        sku: json["sku"],
        featureImage: json["feature_image"],
        regularPrice: json["regular_price"] == null
            ? "0.0"
            : json["regular_price"].toString(),
        sellingPrice: json["selling_price"].toString(),
        stockCount: json["stock_count"],
        soldCount: json["sold_count"],
        expireDate: DateTime.parse(json["expire_date"]),
        isStock: json["is_stock"],
        brand: Brand.fromJson(json["brand"]),
        country: Brand.fromJson(json["country"]),
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        subCategory: List<SubCategory>.from(
            json["sub_category"].map((x) => SubCategory.fromJson(x))),
      );
}
