import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'dart:convert';

List<FlashSaleModel> flashSaleModelFromJson(String str) =>
    List<FlashSaleModel>.from(
        json.decode(str).map((x) => FlashSaleModel.fromJson(x)));

class FlashSaleModel {
  FlashSaleModel({
    required this.id,
    required this.flashSaleId,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.products,
  });

  int id;
  int flashSaleId;
  String name;
  DateTime startTime;
  DateTime endTime;
  List<FlashProduct> products;

  factory FlashSaleModel.fromJson(Map<String, dynamic> json) => FlashSaleModel(
        id: json["id"],
        flashSaleId: json["flash_sale_ID"],
        name: json["name"] ?? "",
        startTime: json["start_time"] == null
            ? DateTime.now()
            : DateTime.parse(json["start_time"]),
        endTime: json["end_time"] == null
            ? DateTime.now()
            : DateTime.parse(json["end_time"]),
        products: List<FlashProduct>.from(
            json["products"].map((x) => FlashProduct.fromJson(x))),
      );
}

class FlashProduct {
  FlashProduct({
    required this.id,
    required this.flashProduct,
    required this.flashDiscount,
    required this.flashPrice,
    required this.isActive,
  });

  int id;
  ProductModel flashProduct;
  int flashDiscount;
  double flashPrice;
  bool isActive;

  factory FlashProduct.fromJson(Map<String, dynamic> json) => FlashProduct(
        id: json["id"],
        flashProduct: ProductModel.fromJson(json["flash_product"]),
        flashDiscount: json["flash_discount"] ?? 0,
        flashPrice: json["flash_price"] ?? 0.0,
        isActive: json["is_active"] ?? false,
      );
}
