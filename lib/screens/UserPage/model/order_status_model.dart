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
  Customer customer;
  Address address;
  dynamic coupon;
  List<Item> items;

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
        customer: Customer.fromJson(json["customer"]),
        address: Address.fromJson(json["address"]),
        coupon: json["coupon"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
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
  int customer;

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
        customer: json["customer"],
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
        "customer": customer,
      };
}

class Customer {
  Customer({
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

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
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

class Item {
  Item({
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
  int item;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        quantity: json["quantity"],
        attr: json["attr"],
        isOrder: json["is_order"],
        amountItem: json["amount_item"],
        totalAmountItem: json["total_amount_item"],
        item: json["item"],
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
        "item": item,
      };
}
