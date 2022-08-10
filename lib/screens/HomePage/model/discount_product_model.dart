import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'dart:convert';

List<DiscountProductModel> discountProductModelFromJson(String str) =>
    List<DiscountProductModel>.from(
        json.decode(str).map((x) => DiscountProductModel.fromJson(x)));

class DiscountProductModel {
  DiscountProductModel({
    required this.id,
    required this.discountProduct,
    required this.discount,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  ProductModel discountProduct;
  int discount;
  double price;
  DateTime createdAt;
  DateTime updatedAt;

  factory DiscountProductModel.fromJson(Map<String, dynamic> json) =>
      DiscountProductModel(
        id: json["id"],
        discountProduct: ProductModel.fromJson(json["discount_product"]),
        discount: json["discount"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
