// To parse this JSON data, do
//
//     final orderStatusModel = orderStatusModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<OrderStatusModel> orderStatusModelFromJson(String str) =>
    List<OrderStatusModel>.from(
        json.decode(str).map((x) => OrderStatusModel.fromJson(x)));

String orderStatusModelToJson(List<OrderStatusModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderStatusModel {
  OrderStatusModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.refCode,
    required this.mobile,
    required this.email,
    required this.orderedDate,
    required this.total,
    required this.orderStatus,
    required this.paymentMethod,
    required this.paymentComplete,
    required this.isOrder,
    required this.firstDeliverry,
    required this.customer,
    required this.address,
    required this.coupon,
    required this.items,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  String refCode;
  String mobile;
  String email;
  DateTime orderedDate;
  int total;
  String orderStatus;
  String paymentMethod;
  bool paymentComplete;
  bool isOrder;
  bool firstDeliverry;
  OrderStatusModelCustomer customer;
  Address address;
  dynamic coupon;
  List<ItemElement> items;

  factory OrderStatusModel.fromJson(Map<String, dynamic> json) =>
      OrderStatusModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        refCode: json["ref_code"],
        mobile: json["mobile"],
        email: json["email"],
        orderedDate: DateTime.parse(json["ordered_date"]),
        total: json["total"],
        orderStatus: json["order_status"],
        paymentMethod: json["payment_method"],
        paymentComplete: json["payment_complete"],
        isOrder: json["is_order"],
        firstDeliverry: json["first_deliverry"],
        customer: OrderStatusModelCustomer.fromJson(json["customer"]),
        address: Address.fromJson(json["address"]),
        coupon: json["coupon"],
        items: List<ItemElement>.from(
            json["items"].map((x) => ItemElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "ref_code": refCode,
        "mobile": mobile,
        "email": email,
        "ordered_date": orderedDate.toIso8601String(),
        "total": total,
        "order_status": orderStatus,
        "payment_method": paymentMethod,
        "payment_complete": paymentComplete,
        "is_order": isOrder,
        "first_deliverry": firstDeliverry,
        "customer": customer.toJson(),
        "address": address.toJson(),
        "coupon": coupon,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Address {
  Address({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.region,
    required this.city,
    required this.area,
    required this.postCode,
    required this.address,
    required this.customer,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  String region;
  String city;
  String area;
  String postCode;
  String address;
  AddressCustomer customer;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        region: json["region"],
        city: json["city"],
        area: json["area"],
        postCode: json["post_code"],
        address: json["address"],
        customer: AddressCustomer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "region": region,
        "city": city,
        "area": area,
        "post_code": postCode,
        "address": address,
        "customer": customer.toJson(),
      };
}

class AddressCustomer {
  AddressCustomer({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.fullName,
    required this.address,
    required this.city,
    required this.zipcode,
    required this.country,
    required this.phone,
    required this.isPhoneVerified,
    required this.phoneOtp,
    required this.customerId,
    required this.pointsGained,
    required this.user,
    required this.permission,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  String fullName;
  dynamic address;
  dynamic city;
  dynamic zipcode;
  dynamic country;
  String phone;
  bool isPhoneVerified;
  String phoneOtp;
  String customerId;
  int pointsGained;
  int user;
  List<int> permission;

  factory AddressCustomer.fromJson(Map<String, dynamic> json) =>
      AddressCustomer(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        fullName: json["full_name"],
        address: json["address"],
        city: json["city"],
        zipcode: json["zipcode"],
        country: json["country"],
        phone: json["phone"],
        isPhoneVerified: json["is_phone_verified"],
        phoneOtp: json["phone_otp"],
        customerId: json["customer_ID"],
        pointsGained: json["points_gained"],
        user: json["user"],
        permission: List<int>.from(json["permission"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "full_name": fullName,
        "address": address,
        "city": city,
        "zipcode": zipcode,
        "country": country,
        "phone": phone,
        "is_phone_verified": isPhoneVerified,
        "phone_otp": phoneOtp,
        "customer_ID": customerId,
        "points_gained": pointsGained,
        "user": user,
        "permission": List<dynamic>.from(permission.map((x) => x)),
      };
}

class OrderStatusModelCustomer {
  OrderStatusModelCustomer({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.fullName,
    required this.address,
    required this.city,
    required this.zipcode,
    required this.country,
    required this.phone,
    required this.isPhoneVerified,
    required this.phoneOtp,
    required this.customerId,
    required this.pointsGained,
    required this.user,
    required this.permission,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  String fullName;
  dynamic address;
  dynamic city;
  dynamic zipcode;
  dynamic country;
  String phone;
  bool isPhoneVerified;
  String phoneOtp;
  String customerId;
  int pointsGained;
  User user;
  List<Permission> permission;

  factory OrderStatusModelCustomer.fromJson(Map<String, dynamic> json) =>
      OrderStatusModelCustomer(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        fullName: json["full_name"],
        address: json["address"],
        city: json["city"],
        zipcode: json["zipcode"],
        country: json["country"],
        phone: json["phone"],
        isPhoneVerified: json["is_phone_verified"],
        phoneOtp: json["phone_otp"],
        customerId: json["customer_ID"],
        pointsGained: json["points_gained"],
        user: User.fromJson(json["user"]),
        permission: List<Permission>.from(
            json["permission"].map((x) => Permission.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "full_name": fullName,
        "address": address,
        "city": city,
        "zipcode": zipcode,
        "country": country,
        "phone": phone,
        "is_phone_verified": isPhoneVerified,
        "phone_otp": phoneOtp,
        "customer_ID": customerId,
        "points_gained": pointsGained,
        "user": user.toJson(),
        "permission": List<dynamic>.from(permission.map((x) => x.toJson())),
      };
}

class Permission {
  Permission({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.permissionName,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  String permissionName;

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        permissionName: json["permission_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "permission_name": permissionName,
      };
}

class User {
  User({
    required this.id,
    required this.lastLogin,
    required this.isSuperuser,
    required this.username,
    required this.email,
    required this.isStaff,
    required this.isActive,
    required this.password,
    required this.confirmPassword,
    required this.dateJoined,
    required this.groups,
    required this.userPermissions,
  });

  int id;
  DateTime lastLogin;
  bool isSuperuser;
  String username;
  dynamic email;
  bool isStaff;
  bool isActive;
  String password;
  String confirmPassword;
  DateTime dateJoined;
  List<dynamic> groups;
  List<dynamic> userPermissions;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        lastLogin: DateTime.parse(json["last_login"]),
        isSuperuser: json["is_superuser"],
        username: json["username"],
        email: json["email"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
        dateJoined: DateTime.parse(json["date_joined"]),
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions:
            List<dynamic>.from(json["user_permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "last_login": lastLogin.toIso8601String(),
        "is_superuser": isSuperuser,
        "username": username,
        "email": email,
        "is_staff": isStaff,
        "is_active": isActive,
        "password": password,
        "confirm_password": confirmPassword,
        "date_joined":
            "${dateJoined.year.toString().padLeft(4, '0')}-${dateJoined.month.toString().padLeft(2, '0')}-${dateJoined.day.toString().padLeft(2, '0')}",
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
      };
}

class ItemElement {
  ItemElement({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.quantity,
    required this.attr,
    required this.isOrder,
    required this.amountItem,
    required this.totalAmountItem,
    required this.item,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  int quantity;
  String attr;
  bool isOrder;
  int amountItem;
  int totalAmountItem;
  ItemItem item;

  factory ItemElement.fromJson(Map<String, dynamic> json) => ItemElement(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        quantity: json["quantity"],
        attr: json["attr"],
        isOrder: json["is_order"],
        amountItem: json["amount_item"],
        totalAmountItem: json["total_amount_item"],
        item: ItemItem.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "quantity": quantity,
        "attr": attr,
        "is_order": isOrder,
        "amount_item": amountItem,
        "total_amount_item": totalAmountItem,
        "item": item.toJson(),
      };
}

class ItemItem {
  ItemItem({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.productName,
    required this.slug,
    required this.meta,
    required this.shortDescriptions,
    required this.longDescription,
    required this.alterText,
    required this.sku,
    required this.featureImage,
    required this.soldCount,
    required this.expireRate,
    required this.isStock,
    required this.brand,
    required this.country,
    required this.category,
    required this.subCategory,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  String productName;
  String slug;
  String meta;
  String shortDescriptions;
  String longDescription;
  String alterText;
  String sku;
  String featureImage;
  dynamic soldCount;
  DateTime expireRate;
  bool isStock;
  int brand;
  int country;
  List<int> category;
  List<int> subCategory;

  factory ItemItem.fromJson(Map<String, dynamic> json) => ItemItem(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        productName: json["product_name"],
        slug: json["slug"],
        meta: json["meta"],
        shortDescriptions: json["short_descriptions"],
        longDescription: json["long_description"],
        alterText: json["alter_text"],
        sku: json["sku"],
        featureImage: json["feature_image"],
        soldCount: json["sold_count"],
        expireRate: DateTime.parse(json["expire_rate"]),
        isStock: json["is_stock"],
        brand: json["brand"],
        country: json["country"],
        category: List<int>.from(json["category"].map((x) => x)),
        subCategory: List<int>.from(json["sub_category"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "product_name": productName,
        "slug": slug,
        "meta": meta,
        "short_descriptions": shortDescriptions,
        "long_description": longDescription,
        "alter_text": alterText,
        "sku": sku,
        "feature_image": featureImage,
        "sold_count": soldCount,
        "expire_rate":
            "${expireRate.year.toString().padLeft(4, '0')}-${expireRate.month.toString().padLeft(2, '0')}-${expireRate.day.toString().padLeft(2, '0')}",
        "is_stock": isStock,
        "brand": brand,
        "country": country,
        "category": List<dynamic>.from(category.map((x) => x)),
        "sub_category": List<dynamic>.from(subCategory.map((x) => x)),
      };
}
