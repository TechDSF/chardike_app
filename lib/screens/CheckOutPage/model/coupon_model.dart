import 'dart:convert';

CouponModel couponModelFromJson(String str) =>
    CouponModel.fromJson(json.decode(str));

class CouponModel {
  CouponModel({
    required this.id,
    required this.couponName,
    required this.couponType,
    required this.couponAmount,
    required this.freeShipping,
    required this.expireDate,
    required this.maximumUser,
    required this.minimumSale,
    required this.maximumSale,
    required this.category,
    required this.brand,
    required this.product,
    required this.couponCount,
  });

  int id;
  String couponName;
  String couponType;
  double couponAmount;
  bool freeShipping;
  DateTime expireDate;
  int maximumUser;
  int minimumSale;
  int maximumSale;
  List<int> category;
  List<int> brand;
  List<int> product;
  int couponCount;

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        id: json["id"],
        couponName: json["coupon_name"],
        couponType: json["coupon_type"],
        couponAmount: json["coupon_amount"],
        freeShipping: json["free_shipping"] ?? false,
        expireDate: DateTime.parse(json["expire_date"]),
        maximumUser: json["maximum_user"] ?? 0,
        minimumSale: json["minimum_sale"] ?? 0,
        maximumSale: json["maximum_sale"] ?? 0,
        category: List<int>.from(json["category"].map((x) => x)),
        brand: List<int>.from(json["brand"].map((x) => x)),
        product: List<int>.from(json["product"].map((x) => x)),
        couponCount: json["coupon_count"] ?? 0,
      );
}
