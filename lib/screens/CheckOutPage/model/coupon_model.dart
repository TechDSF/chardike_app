// To parse this JSON data, do
//
//     final couponModel = couponModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CouponModel> couponModelFromJson(String str) => List<CouponModel>.from(
    json.decode(str).map((x) => CouponModel.fromJson(x)));

String couponModelToJson(List<CouponModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CouponModel {
  CouponModel({
    required this.id,
    required this.couponName,
    required this.couponType,
    required this.couponAmount,
    required this.freeShipping,
    required this.expireDate,
    required this.minimumUser,
    required this.minimumSale,
    required this.maximumSale,
  });

  int id;
  String couponName;
  String couponType;
  double couponAmount;
  bool freeShipping;
  DateTime expireDate;
  int minimumUser;
  double minimumSale;
  double maximumSale;

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        id: json["id"],
        couponName: json["coupon_name"] ?? "",
        couponType: json["coupon_type"] ?? "",
        couponAmount: json["coupon_amount"] ?? 0.0,
        freeShipping: json["free_shipping"] ?? false,
        expireDate: DateTime.parse(json["expire_date"]),
        minimumUser: json["minimum_user"] ?? 0,
        minimumSale: json["minimum_sale"].toDouble() ?? 0.0,
        maximumSale: json["maximum_sale"].toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "coupon_name": couponName,
        "coupon_type": couponType,
        "coupon_amount": couponAmount,
        "free_shipping": freeShipping,
        "expire_date":
            "${expireDate.year.toString().padLeft(4, '0')}-${expireDate.month.toString().padLeft(2, '0')}-${expireDate.day.toString().padLeft(2, '0')}",
        "minimum_user": minimumUser,
        "minimum_sale": minimumSale,
        "maximum_sale": maximumSale,
      };
}
