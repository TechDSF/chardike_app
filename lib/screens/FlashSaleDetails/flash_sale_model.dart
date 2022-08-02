import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

List<FlashSaleModel> flashSaleModelFromJson(String str) =>
    List<FlashSaleModel>.from(
        json.decode(str).map((x) => FlashSaleModel.fromJson(x)));

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
  List<ProductElement> products;

  factory FlashSaleModel.fromJson(Map<String, dynamic> json) => FlashSaleModel(
        flashSaleId: json["flash_sale_ID"],
        name: json["name"],
        discount: json["discount"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
      );
}

class ProductElement {
  ProductElement({
    required this.flashProduct,
    required this.flashPrice,
    required this.isActive,
  });

  ProductModel flashProduct;
  double flashPrice;
  bool isActive;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        flashProduct: ProductModel.fromJson(json["flash_product"]),
        flashPrice: json["flash_price"],
        isActive: json["is_active"],
      );
}
