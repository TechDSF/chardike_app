import 'dart:convert';

List<OrderStatusModel> orderStatusModelFromJson(String str) =>
    List<OrderStatusModel>.from(
        json.decode(str).map((x) => OrderStatusModel.fromJson(x)));

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
  dynamic coupon;
  List<ItemElement> items;

  factory OrderStatusModel.fromJson(Map<String, dynamic> json) =>
      OrderStatusModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"] ?? false,
        refCode: json["ref_code"] ?? "",
        mobile: json["mobile"] ?? "",
        email: json["email"] ?? "",
        orderedDate: json["ordered_date"] == null
            ? DateTime.now()
            : DateTime.parse(json["ordered_date"]),
        total: json["total"] ?? 0,
        orderStatus: json["order_status"] ?? "",
        paymentMethod: json["payment_method"] ?? "",
        paymentComplete: json["payment_complete"] ?? false,
        isOrder: json["is_order"] ?? false,
        firstDeliverry: json["fast_delivery"] ?? false,
        customer: OrderStatusModelCustomer.fromJson(json["customer"]),
        coupon: json["coupon"] ?? "",
        items: List<ItemElement>.from(
            json["items"].map((x) => ItemElement.fromJson(x))),
      );
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
        isActive: json["is_active"] ?? false,
        fullName: json["full_name"] ?? "",
        address: json["address"] ?? "",
        city: json["city"] ?? "",
        zipcode: json["zipcode"] ?? "",
        country: json["country"] ?? "",
        phone: json["phone"] ?? "",
        isPhoneVerified: json["is_phone_verified"] ?? false,
        phoneOtp: json["phone_otp"] ?? "",
        customerId: json["customer_ID"] ?? "",
        pointsGained: json["points_gained"] ?? 0,
        user: json["user"] ?? 0,
        permission: List<int>.from(json["permission"].map((x) => x)),
      );
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
        isActive: json["is_active"] ?? false,
        fullName: json["full_name"] ?? "",
        address: json["address"] ?? "",
        city: json["city"] ?? "",
        zipcode: json["zipcode"] ?? "",
        country: json["country"] ?? "",
        phone: json["phone"] ?? "",
        isPhoneVerified: json["is_phone_verified"] ?? false,
        phoneOtp: json["phone_otp"] ?? "",
        customerId: json["customer_ID"] ?? "",
        pointsGained: json["points_gained"] ?? 0,
        user: User.fromJson(json["user"]),
        permission: List<Permission>.from(
            json["permission"].map((x) => Permission.fromJson(x))),
      );
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
        isActive: json["is_active"] ?? false,
        permissionName: json["permission_name"] ?? "",
      );
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
        lastLogin: json["last_login"] == null
            ? DateTime.now()
            : DateTime.parse(json["last_login"]),
        isSuperuser: json["is_superuser"] ?? false,
        username: json["username"] ?? "",
        email: json["email"] ?? "",
        isStaff: json["is_staff"],
        isActive: json["is_active"] ?? false,
        password: json["password"] ?? "",
        confirmPassword: json["confirm_password"] ?? "",
        dateJoined: json["date_joined"] == null
            ? DateTime.now()
            : DateTime.parse(json["date_joined"]),
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions:
            List<dynamic>.from(json["user_permissions"].map((x) => x)),
      );
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
        isActive: json["is_active"] ?? false,
        quantity: json["quantity"] ?? 0,
        attr: json["attr"] ?? "",
        isOrder: json["is_order"] ?? false,
        amountItem: json["amount_item"] ?? 0,
        totalAmountItem: json["total_amount_item"] ?? 0,
        item: ItemItem.fromJson(json["item"]),
      );
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
  bool isStock;
  int brand;
  int country;
  List<int> category;
  List<int> subCategory;

  factory ItemItem.fromJson(Map<String, dynamic> json) => ItemItem(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"] ?? false,
        productName: json["product_name"] ?? "",
        slug: json["slug"] ?? "",
        meta: json["meta"] ?? "",
        shortDescriptions: json["short_descriptions"] ?? "",
        longDescription: json["long_description"] ?? "",
        alterText: json["alter_text"] ?? "",
        sku: json["sku"] ?? "",
        featureImage: json["feature_image"] ??
            "https://firebasestorage.googleapis.com/v0/b/quizer-ff18d.appspot.com/o/Screenshot%202022-07-26%20at%2011.57.26%20AM.png?alt=media&token=addadafb-a5fc-42ed-a351-424e7af30e54",
        soldCount: json["sold_count"] ?? 0,
        isStock: json["is_stock"] ?? false,
        brand: json["brand"] ?? 0,
        country: json["country"] ?? 0,
        category: List<int>.from(json["category"].map((x) => x)),
        subCategory: List<int>.from(json["sub_category"].map((x) => x)),
      );
}
