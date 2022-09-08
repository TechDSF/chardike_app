import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'dart:convert';

List<BannerModel> bannerModelFromJson(String str) => List<BannerModel>.from(
    json.decode(str).map((x) => BannerModel.fromJson(x)));

class BannerModel {
  BannerModel({
    required this.bannerId,
    required this.name,
    required this.title,
    required this.bannerImage,
    required this.products,
    required this.isSlider,
  });

  int bannerId;
  String name;
  String title;
  String bannerImage;
  List<Product> products;
  bool isSlider;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        bannerId: json["banner_ID"],
        name: json["name"] ?? "",
        title: json["title"] ?? "",
        bannerImage: json["banner_image"] ??
            "https://firebasestorage.googleapis.com/v0/b/quizer-ff18d.appspot.com/o/Screenshot%202022-07-26%20at%2011.57.26%20AM.png?alt=media&token=addadafb-a5fc-42ed-a351-424e7af30e54",
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        isSlider: json["is_slider"],
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
        isActive: json["is_active"] ?? false,
      );
}
