// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<AddressModel> addressModelFromJson(String str) => List<AddressModel>.from(
    json.decode(str).map((x) => AddressModel.fromJson(x)));

class AddressModel {
  AddressModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.region,
    required this.city,
    required this.area,
    required this.postCode,
    required this.address,
    required this.isBilling,
  });

  int id;
  String name;
  String email;
  String phone;
  String region;
  String city;
  String area;
  String postCode;
  String address;
  bool isBilling;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json["id"],
        name: json["name"] ?? "Name",
        email: json["email"] == null ? "abc@...mail" : json["email"],
        phone: json["phone"] ?? "01......",
        region: json["region"] ?? "Division",
        city: json["city"] ?? "City",
        area: json["area"] ?? "Area",
        postCode: json["post_code"] ?? "12...",
        address: json["address"] ?? "Address",
        isBilling: json["is_billing"],
      );
}
