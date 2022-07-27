// To parse this JSON data, do
//
//     final flashSaleModel = flashSaleModelFromJson(jsonString);

import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

List<FlashSaleModel> flashSaleModelFromJson(String str) =>
    List<FlashSaleModel>.from(
        json.decode(str).map((x) => FlashSaleModel.fromJson(x)));

String flashSaleModelToJson(List<FlashSaleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FlashSaleModel {
  FlashSaleModel({
    required this.flashSaleId,
    required this.name,
    required this.discount,
    required this.startTime,
    required this.endTime,
    required this.products,
  });

  int flashSaleId;
  String name;
  int discount;
  DateTime startTime;
  DateTime endTime;
  List<Product> products;

  factory FlashSaleModel.fromJson(Map<String, dynamic> json) => FlashSaleModel(
        flashSaleId: json["flash_sale_ID"],
        name: json["name"],
        discount: json["discount"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "flash_sale_ID": flashSaleId,
        "name": name,
        "discount": discount,
        "start_time": startTime.toIso8601String(),
        "end_time": endTime.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.flashProduct,
    required this.flashPrice,
    required this.isActive,
  });

  ProductModel flashProduct;
  double flashPrice;
  bool isActive;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        flashProduct: ProductModel.fromJson(json["flash_product"]),
        flashPrice: json["flash_price"].toDouble(),
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "flash_product": flashProduct.toJson(),
        "flash_price": flashPrice,
        "is_active": isActive,
      };
}
