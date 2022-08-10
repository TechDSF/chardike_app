import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'dart:convert';

List<BannerModel> bannerModelFromJson(String str) => List<BannerModel>.from(
    json.decode(str).map((x) => BannerModel.fromJson(x)));

class BannerModel {
  BannerModel({
    required this.bannerId,
    required this.name,
    required this.bannerImage,
    required this.products,
  });

  int bannerId;
  String name;
  String bannerImage;
  List<Product> products;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        bannerId: json["banner_ID"],
        name: json["name"],
        bannerImage: json["banner_image"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );
}

class Product {
  Product({
    required this.bannerProduct,
    required this.isActive,
  });

  ProductModel? bannerProduct;
  bool isActive;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        bannerProduct: json["banner_product"] == null
            ? null
            : ProductModel.fromJson(json["banner_product"]),
        isActive: json["is_active"],
      );
}
