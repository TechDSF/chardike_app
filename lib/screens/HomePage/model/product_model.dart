import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

class ProductModel {
  ProductModel({
    required this.id,
    required this.brand,
    required this.country,
    required this.sku,
    required this.category,
    required this.subCategory,
    required this.productName,
    required this.slug,
    required this.meta,
    required this.shortDescriptions,
    required this.longDescription,
    required this.alterText,
    required this.tags,
    required this.featureImage,
    required this.productImage,
    required this.soldCount,
    required this.expireDate,
    required this.regularPrice,
    required this.sellingPrice,
    required this.attribute,
    required this.resellerPrice,
    required this.isStock,
    required this.reviews,
    required this.totalQuantity,
  });

  int id;
  Brand brand;
  Brand country;
  String sku;
  List<Category> category;
  List<SubCategory> subCategory;
  String productName;
  String slug;
  String meta;
  String shortDescriptions;
  String longDescription;
  String alterText;
  String tags;
  String featureImage;
  List<ProductImage> productImage;
  dynamic soldCount;
  dynamic expireDate;
  String regularPrice;
  String sellingPrice;
  dynamic attribute;
  dynamic resellerPrice;
  bool isStock;
  List<Review> reviews;
  int totalQuantity;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        brand: Brand.fromJson(json["brand"]),
        country: Brand.fromJson(json["country"]),
        sku: json["sku"] ?? "",
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        subCategory: List<SubCategory>.from(
            json["sub_category"].map((x) => SubCategory.fromJson(x))),
        productName: json["product_name"],
        slug: json["slug"],
        meta: json["meta"] ?? "",
        shortDescriptions: json["short_descriptions"] ?? "",
        longDescription: json["long_description"] ?? "",
        alterText: json["alter_text"] ?? "",
        tags: json["tags"] ?? "",
        featureImage: json["feature_image"] ??
            "https://firebasestorage.googleapis.com/v0/b/quizer-ff18d.appspot.com/o/Screenshot%202022-07-26%20at%2011.57.26%20AM.png?alt=media&token=addadafb-a5fc-42ed-a351-424e7af30e54",
        productImage: List<ProductImage>.from(
            json["product_image"].map((x) => ProductImage.fromJson(x))),
        soldCount: json["sold_count"],
        expireDate: json["expire_date"],
        regularPrice: json["regular_price"] == null
            ? "0.0"
            : json["regular_price"].toString(),
        sellingPrice: json["selling_price"].toString(),
        attribute: json["attribute"],
        resellerPrice: json["reseller_price"],
        isStock: json["is_stock"],
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        totalQuantity: json["total_quantity"],
      );
}

class Brand {
  Brand({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.name,
    required this.brandWebsite,
    required this.description,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  String name;
  String brandWebsite;
  String description;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        name: json["name"],
        brandWebsite:
            json["brand_website"] == null ? "" : json["brand_website"],
        description: json["description"] ?? "",
      );
}

class Category {
  Category({
    required this.id,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.categoryName,
    required this.slug,
    required this.categoryCode,
  });

  int id;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  String categoryName;
  String slug;
  String categoryCode;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        image: json["image"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        categoryName: json["category_name"],
        slug: json["slug"],
        categoryCode: json["category_code"] ?? "",
      );
}

class ProductImage {
  ProductImage({
    required this.image,
  });

  String image;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        image: json["image"] ?? "",
      );
}

class Review {
  Review({
    required this.id,
    required this.isActive,
    required this.profile,
    required this.product,
    required this.starCount,
    required this.review,
  });

  int id;
  bool isActive;
  Profile profile;
  Product product;
  int starCount;
  String review;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        isActive: json["is_active"],
        profile: Profile.fromJson(json["profile"]),
        product: Product.fromJson(json["product"]),
        starCount: json["star_count"],
        review: json["review"],
      );
}

class Product {
  Product({
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
    required this.tags,
    required this.sku,
    required this.featureImage,
    required this.attribute,
    required this.regularPrice,
    required this.sellingPrice,
    required this.resellerPrice,
    required this.soldCount,
    required this.expireDate,
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
  String tags;
  String sku;
  String featureImage;
  dynamic attribute;
  double regularPrice;
  double sellingPrice;
  dynamic resellerPrice;
  dynamic soldCount;
  dynamic expireDate;
  bool isStock;
  int brand;
  int country;
  List<int> category;
  List<int> subCategory;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
        tags: json["tags"],
        sku: json["sku"],
        featureImage: json["feature_image"],
        attribute: json["attribute"],
        regularPrice: json["regular_price"],
        sellingPrice: json["selling_price"],
        resellerPrice: json["reseller_price"],
        soldCount: json["sold_count"],
        expireDate: json["expire_date"],
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
        "tags": tags,
        "sku": sku,
        "feature_image": featureImage,
        "attribute": attribute,
        "regular_price": regularPrice,
        "selling_price": sellingPrice,
        "reseller_price": resellerPrice,
        "sold_count": soldCount,
        "expire_date": expireDate,
        "is_stock": isStock,
        "brand": brand,
        "country": country,
        "category": List<dynamic>.from(category.map((x) => x)),
        "sub_category": List<dynamic>.from(subCategory.map((x) => x)),
      };
}

class Profile {
  Profile({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.fullName,
    required this.dob,
    required this.gender,
    required this.bio,
    required this.profilePicture,
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
  dynamic dob;
  dynamic gender;
  dynamic bio;
  dynamic profilePicture;
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

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        fullName: json["full_name"],
        dob: json["dob"],
        gender: json["gender"],
        bio: json["bio"],
        profilePicture: json["profile_picture"] ?? "",
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
        "dob": dob,
        "gender": gender,
        "bio": bio,
        "profile_picture": profilePicture,
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

class SubCategory {
  SubCategory({
    required this.id,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.subCategoryName,
    required this.slug,
    required this.description,
  });

  int id;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  String subCategoryName;
  String slug;
  String description;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        image: json["image"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        subCategoryName: json["sub_category_name"],
        slug: json["slug"] ?? "",
        description: json["description"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "sub_category_name": subCategoryName,
        "slug": slug,
        "description": description,
      };
}
