// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<AddressModel> addressModelFromJson(String str) => List<AddressModel>.from(
    json.decode(str).map((x) => AddressModel.fromJson(x)));

String addressModelToJson(List<AddressModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddressModel {
  AddressModel({
    required this.id,
    required this.region,
    required this.city,
    required this.area,
    required this.postCode,
    required this.address,
  });

  int id;
  String region;
  String city;
  String area;
  String postCode;
  String address;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json["id"],
        region: json["region"] ?? "",
        city: json["city"] ?? "",
        area: json["area"] ?? "",
        postCode: json["post_code"] ?? "",
        address: json["address"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "region": region,
        "city": city,
        "area": area,
        "post_code": postCode,
        "address": address,
      };
}
