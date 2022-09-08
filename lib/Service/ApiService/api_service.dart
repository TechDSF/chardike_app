import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:chardike/Service/ApiService/api_components.dart';
import 'package:chardike/screens/HomePage/model/slider_mode.dart';
import 'package:chardike/screens/ProductDetails/model/review_model.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../screens/CategoryPage/model/brand_model.dart';
import '../../screens/CategoryPage/model/category_model.dart';
import '../../screens/CategoryPage/model/single_category_product_model.dart';
import '../../screens/CategoryPage/model/sub_category_model.dart';
import '../../screens/CheckOutPage/model/address_model.dart';
import '../../screens/CheckOutPage/model/coupon_model.dart';
import '../../screens/CheckOutPage/model/item_id_model.dart';
import '../../screens/FeedPage/model/feed_model.dart';
import '../../screens/FlashSaleDetails/flash_sale_model.dart';
import '../../screens/HomePage/model/banner_model.dart';
import '../../screens/HomePage/model/discount_product_model.dart';
import '../../screens/HomePage/model/hot_sale_model.dart';
import '../../screens/HomePage/model/product_model.dart';
import '../../screens/SearchPage/model/category_product_model.dart';
import '../../screens/SearchPage/model/country_model.dart';
import '../../screens/UserPage/model/order_status_model.dart';

class ApiService {
  static var client = http.Client();

  ///fetch popular products
  static dynamic fetchAllProducts() async {
    var headers = {'Content-Type': 'application/json'};
    var response = await client.get(Uri.parse(productUrl), headers: headers);
    if (response.statusCode == 200) {
      return productModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  ///fetch main categories
  static dynamic fetchCategories() async {
    var headers = {'Content-Type': 'application/json'};
    var response = await client.get(Uri.parse(categoriesUrl), headers: headers);
    if (response.statusCode == 200) {
      return categoryModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  ///fetch main categories
  static dynamic fetchSubCategories() async {
    var headers = {'Content-Type': 'application/json'};
    var response =
        await client.get(Uri.parse(subCategoriesUrl), headers: headers);
    if (response.statusCode == 200) {
      return subCategoryModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  ///fetch all brands
  static dynamic fetchBrands() async {
    var headers = {'Content-Type': 'application/json'};
    var response = await client.get(Uri.parse(brandUrl), headers: headers);
    if (response.statusCode == 200) {
      print("work");
      return brandModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  ///fetch all brands
  static dynamic fetchBanners() async {
    var headers = {'Content-Type': 'application/json'};
    var response = await client.get(Uri.parse(bannerUrl), headers: headers);
    if (response.statusCode == 200) {
      print("Brand service work");
      return bannerModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  ///fetch popular products
  static dynamic fetchFeatureProducts() async {
    var headers = {'Content-Type': 'application/json'};
    var response =
        await client.get(Uri.parse(featureProductUrl), headers: headers);
    if (response.statusCode == 200) {
      return productModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  ///fetch flash products
  static dynamic getFlashProduct() async {
    var headers = {'Content-Type': 'application/json'};
    var response = await client.get(Uri.parse(falshSaleUrl), headers: headers);
    if (response.statusCode == 200) {
      return flashSaleModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  ///fetch latest products
  static dynamic fetchLatestProducts() async {
    var headers = {'Content-Type': 'application/json'};
    var response =
        await client.get(Uri.parse(latestProductUrl), headers: headers);
    if (response.statusCode == 200) {
      return productModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  ///fetch hot sale products
  static dynamic fetchHotSaleProducts() async {
    var headers = {'Content-Type': 'application/json'};
    var response =
        await client.get(Uri.parse(hotSaleProductUrl), headers: headers);
    if (response.statusCode == 200) {
      return productModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  ///fetch Top sale products
  static dynamic fetchTopSaleProducts() async {
    var headers = {'Content-Type': 'application/json'};
    var response =
        await client.get(Uri.parse(topSaleProductUrl), headers: headers);
    if (response.statusCode == 200) {
      return productModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  ///get query product
  static dynamic fetchQueryProducts() async {
    var headers = {'Content-Type': 'application/json'};
    var response =
        await client.get(Uri.parse(queryProductUrl), headers: headers);
    if (response.statusCode == 200) {
      return productModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  ///get country list
  static dynamic fetchCountry() async {
    var headers = {'Content-Type': 'application/json'};
    var response = await client.get(Uri.parse(countryUrl), headers: headers);
    if (response.statusCode == 200) {
      return countryModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  ///fetch category product by id
  static dynamic fetchCategoryProductById({required String id}) async {
    var headers = {'Content-Type': 'application/json'};
    var response = await client.get(
        Uri.parse(baseUrl + "queries/products/category/$id/"),
        headers: headers);
    if (response.statusCode == 200) {
      return categoryProductModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  ///set profile data
  static dynamic setProfileData(
      {required String dob,
      required String fullName,
      required String gender,
      required bool image,
      required String imageData,
      required String address,
      required String bio,
      required String token}) async {
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      if (image) {
        print("image e dhukse $imageData");
        print(fullName + " " + dob + " " + gender + " " + address + " " + bio);
        var request =
            http.MultipartRequest('POST', Uri.parse(updateProfileUrl));
        request.fields.addAll({
          'full_name': fullName,
          'dob': dob,
          'gender': gender,
          'address': address,
          'bio': bio,
        });
        request.files.add(
            await http.MultipartFile.fromPath('profile_picture', imageData));
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          var responseString = await response.stream.bytesToString();
          final jsonData = json.decode(responseString);
          Map<String, String> map = {
            "full_name": jsonData["full_name"] ?? "Demo User",
            "dob": jsonData["dob"].toString() ?? "",
            "gender": jsonData["gender"] ?? "",
            "profile_picture": jsonData["profile_picture"] ?? "",
            "address": jsonData["address"] ?? "",
            "city": jsonData["city"] ?? "",
            "zipcode": jsonData["zipcode"] ?? "",
            "country": jsonData["country"] ?? "",
            "phone": jsonData["phone"] ?? "",
            "points_gained": jsonData["points_gained"].toString()
          };
          return map;
        } else {
          return false;
        }
      } else {
        print("image e dhuke ni");
        print(fullName + " " + dob + " " + gender + " " + address + " " + bio);
        var body = jsonEncode({
          'full_name': fullName,
          'dob': dob,
          'gender': gender,
          'address': "Address",
          'bio': bio,
        });

        var response = await client.post(Uri.parse(updateProfileUrl),
            body: body, headers: headers);
        if (response.statusCode == 200) {
          var jsonData = json.decode(utf8.decode(response.bodyBytes));
          print(jsonData);
          Map<String, String> map = {
            "full_name": jsonData["full_name"] ?? "Demo User",
            "dob": jsonData['dob'].toString() ?? "",
            "gender": jsonData["gender"] ?? "",
            "profile_picture": jsonData["profile_picture"] ?? "",
            "address": jsonData["address"] ?? "",
            "city": jsonData["city"] ?? "",
            "zipcode": jsonData["zipcode"] ?? "",
            "country": jsonData["country"] ?? "",
            "phone": jsonData["phone"] ?? "",
            "points_gained": jsonData["points_gained"].toString()
          };
          return map;
        } else {
          return false;
        }
      }
    } on Exception catch (e) {
      return false;
    }
  }

  ///get profile data
  static dynamic getProfileData({required String accessToken}) async {
    var headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json'
    };

    var response =
        await client.get(Uri.parse(profileDataUrl), headers: headers);
    if (response.statusCode == 200) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      Map<String, dynamic> map = {
        "full_name": jsonData["full_name"] ?? "Demo User",
        "dob": jsonData["dob"] ?? "",
        "gender": jsonData["gender"] ?? "",
        "profile_picture": jsonData["profile_picture"] ?? "",
        "address": jsonData["address"] ?? "",
        "city": jsonData["city"] ?? "",
        "zipcode": jsonData["zipcode"] ?? "",
        "country": jsonData["country"] ?? "",
        "phone": jsonData["phone"] ?? "",
        "points_gained": jsonData["points_gained"] ?? 0
      };
      return map;
    } else {
      return response.statusCode;
    }
  }

  ///create user
  static Future<bool> createUser(
      {required String email,
      required String password,
      required String fullName,
      required String phone}) async {
    var body = jsonEncode({
      "email": email,
      "password": password,
      "confirm_password": password,
      "full_name": fullName,
      "phone": phone
    });

    var response = await client.post(Uri.parse(userCreateUrl), body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  ///user login
  static Future<bool> userLogin(
      {required String userName, required String password}) async {
    var body = jsonEncode({'username': userName, 'password': password});

    var response = await client.post(Uri.parse(userLoginUrl), body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  ///get slider item list
  static dynamic fetchSliderData() async {
    var headers = {
      'Cookie':
          'csrftoken=b5Agy7kbhlA1IR4YDJzOK3MUBty739mrPIbiepJxY6Na2bjbOPKG3GzodAWJLjIg'
    };
    var response = await client.get(Uri.parse(sliderUrl), headers: headers);
    if (response.statusCode == 200) {
      return sliderModelFromMap(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  ///forgot password
  static dynamic forotPasswordMethod({required String number}) async {
    var url = Uri.parse(updaetPasswordUrl);

    var body = {'phone': number};
    var req = http.MultipartRequest('GET', url);

    req.fields.addAll(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode == 200) {
      var jsonData = json.decode(resBody);
      print(jsonData['profile_ID']);
      return jsonData['profile_ID'];
    } else if (res.statusCode == 204) {
      Fluttertoast.showToast(msg: "No account is available with this number!");
      return 0;
    } else {
      print(res.reasonPhrase);
      Fluttertoast.showToast(msg: "${res.reasonPhrase}!");
      return 0;
    }
  }

  static Future<bool> checkForgotPasswordotp(
      {required String otp, required String profileId}) async {
    var body = jsonEncode({'otp': otp, 'profile_ID': profileId});
    var response = await client.post(Uri.parse(updaetPasswordUrl), body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updatePassword(
      {required String password, required String profileId}) async {
    print("Here is profile id = " + profileId);

    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('PUT', Uri.parse(updaetPasswordUrl));
    request.body = json.encode({
      "password1": password,
      "password2": password,
      "profile_ID": profileId
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      Fluttertoast.showToast(msg: "Password Updated!");
      return true;
    } else {
      return false;
    }
  }

  ///get single category , single brand, single country product
  getProductByCategory({required String type, required String id}) async {
    var headers = {
      'Cookie':
          'csrftoken=b5Agy7kbhlA1IR4YDJzOK3MUBty739mrPIbiepJxY6Na2bjbOPKG3GzodAWJLjIg'
    };
    var response =
        await client.get(Uri.parse(queryProductUrl), headers: headers);
    if (response.statusCode == 200) {
      return productModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  static getSingleCategoryProduct({required String categoryId}) async {
    try {
      var response = await client.get(
        Uri.parse(singleCategoryProductUrl + categoryId + "/"),
      );
      if (response.statusCode == 200) {
        return singleCategoryProductModelFromJson(
            utf8.decode(response.bodyBytes));
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      print("Single category product fetch error! ${e.toString()}");
      return 1;
      // TODO
    }
  }

  ///get user token
  static dynamic getUserToken(
      {required String userName, required String password}) async {
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({'username': userName, 'password': password});

    var response =
        await client.post(Uri.parse(tokenUrl), body: body, headers: headers);
    print(userName + " " + password + "${response.statusCode}");
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var data = {"refresh": jsonData['refresh'], "access": jsonData['access']};
      return data;
    } else {
      print("Error to get update profile token");
      return response.statusCode;
    }
  }

  ///get user refresh token
  static dynamic getRefreshToken({required String refreshT}) async {
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({'refresh': refreshT});
    var response = await client.post(Uri.parse(refreshTokenUrl),
        body: body, headers: headers);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var data = {"refresh": jsonData['refresh'], "access": jsonData['access']};
      return data;
    } else {
      return response.statusCode;
    }
  }

  ///get user billing address
  static Future<bool> setBillingAddress(
      {required String accessToken,
      required String name,
      required String email,
      required String phone,
      required String region,
      required String city,
      required String area,
      required String address,
      required bool isBilling,
      required String postCode}) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    print("$name , $phone, $region, $city , $area, $isBilling");

    var body = json.encode({
      "name": name,
      "phone": phone,
      "email": email,
      "region": region,
      "city": city,
      "area": area,
      "post_code": postCode,
      "address": address,
      "is_billing": isBilling
    });

    var response = await client.post(Uri.parse(billingAddressUrl),
        headers: headers, body: body);
    if (response.statusCode == 201) {
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  ///get user billing address
  static dynamic getBillingAddress({required String accessToken}) async {
    var headers = {'Authorization': 'Bearer $accessToken'};

    var response =
        await client.get(Uri.parse(billingAddressUrl), headers: headers);
    if (response.statusCode == 200) {
      return addressModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  ///get user billing address
  static dynamic getShippingAddress({required String accessToken}) async {
    var headers = {'Authorization': 'Bearer $accessToken'};

    var response =
        await client.get(Uri.parse(shippingAddressUrl), headers: headers);
    if (response.statusCode == 200) {
      return addressModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  static Future<bool> updateUrseAddress(
      {required String nameData,
      required String id,
      required String emailData,
      required String phoneData,
      required String regionData,
      required String cityData,
      required String areaData,
      required String postCodeData,
      required String addressData,
      required bool type}) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var body = json.encode({
        "name": nameData,
        "email": emailData,
        "phone": phoneData,
        "region": regionData,
        "city": cityData,
        "area": areaData,
        "post_code": postCodeData,
        "address": addressData,
        "is_billing": type
      });

      var response = await client.put(Uri.parse(editAddressUrl + "$id/"),
          headers: headers, body: body);

      if (response.statusCode == 200) {
        return true;
      } else {
        print("ex ${response.reasonPhrase}");
        return false;
      }
    } on Exception catch (e) {
      print("ex $e");
      return false;
      // TODO
    }
  }

  ///add cart item
  static dynamic addCartItem({
    required dynamic jsonData,
  }) async {
    var headers = {'Content-Type': 'application/json'};

    var body = jsonData;
    print(jsonData);

    var response = await client.post(Uri.parse(addCartItemUrl),
        headers: headers, body: body);
    if (response.statusCode == 200) {
      print("Cart item add success ${response.body}");
      return itemIdModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      print("Add cart item error ${response.reasonPhrase}");
      return false;
    }
  }

  ///place order
  static dynamic confirmOrder(
      {required String refCode,
      required String accessToken,
      required int address,
      required int billingAddress,
      required dynamic coupen,
      required String total,
      required dynamic items,
      required int shippingFee,
      required int discountPrice,
      required int subTotal,
      required String orderFrom,
      required String orderStatus,
      required bool isOrder,
      required String mobile,
      required String email,
      required String deliverySystem}) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    print("that is $coupen");

    var datetime = DateTime.now();
    var date =
        "${datetime.year}-${datetime.month}-${datetime.day}T${datetime.hour}:${datetime.minute}:22Z";

    var ref = DateTime.now().microsecondsSinceEpoch.toString();
    var refCode = ref.substring(0, 12);

    print("The delivery system is $deliverySystem");

    var body = json.encode({
      "ref_code": refCode,
      "address_shipping": address,
      "address_billing": billingAddress,
      "coupon": coupen,
      "ordered_date": date,
      "items": items,
      "shipping_fee": shippingFee,
      "discount_price": discountPrice,
      "subtotal": subTotal,
      "order_from": orderFrom,
      "total": total,
      "order_status": "Pending",
      "is_order": true,
      "mobile": mobile,
      "user_device": Platform.isIOS ? "IOS" : "ANDROID",
      "email": email,
      "delivery_option": deliverySystem
    });

    var response =
        await client.post(Uri.parse(orderCreate), headers: headers, body: body);
    if (response.statusCode == 201) {
      return true;
    } else {
      print("${response.statusCode} ${response.reasonPhrase}");
      return false;
    }
  }

  ///get order status
  static dynamic getOrderStatus({required String accessToken}) async {
    var headers = {'Authorization': 'Bearer $accessToken'};

    var response =
        await client.get(Uri.parse(orderStatusUrl), headers: headers);
    if (response.statusCode == 200) {
      return orderStatusModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  ///fetch all blogs
  static dynamic getAllBlogs() async {
    var headers = {'Content-Type': 'application/json'};
    var response = await client.get(Uri.parse(blogUrl), headers: headers);
    if (response.statusCode == 200) {
      return feedModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      return response.statusCode;
    }
  }

  ///fetch all blogs
  static dynamic getAdminBlogs() async {
    var headers = {'Content-Type': 'application/json'};
    var response = await client.get(Uri.parse(adminBlogUrl), headers: headers);

    if (response.statusCode == 200) {
      return feedModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      print(response.reasonPhrase);
    }
  }

  ///create blog
  static Future<bool> blogCreate(
      {required String filePath,
      required String title,
      required String description,
      required String token}) async {
    var headers = {'Authorization': 'Bearer $token'};

    var request = http.MultipartRequest('POST', Uri.parse(createBlogUrl));
    request.fields.addAll({
      'title': title,
      'description': description,
      'url_field': 'http://www.devroben.xyz',
      'is_active': 'true',
      'is_customer': 'true'
    });
    request.files.add(await http.MultipartFile.fromPath('image', filePath));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  ///fetch all coupon
  static dynamic getAllCoupon({required String couponName}) async {
    var headers = {'Content-Type': 'application/json'};
    var response = await client.get(
        Uri.parse(baseUrl + "order/coupon/singleview/$couponName/"),
        headers: headers);

    if (response.statusCode == 200) {
      return couponModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      print(response.statusCode);
    }
  }

  ///fetch all reviews
  static dynamic getALlReview() async {
    var headers = {'Content-Type': 'application/json'};
    var response = await client.get(Uri.parse(reviewListUrl), headers: headers);

    if (response.statusCode == 200) {
      return reviewModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      print(response.statusCode);
    }
  }

  ///create product review
  static Future<bool> createReview(
      {required int profileId,
      required int productId,
      required int star,
      required String message}) async {
    var headers = {"Content-Type": "application/json"};

    print("$profileId , $productId, $star, $message");

    var body = jsonEncode({
      "is_active": false,
      "profile": profileId,
      "product": productId,
      "star_count": star,
      "review": message
    });

    var response = await client.post(Uri.parse(createReviewUrl),
        headers: headers, body: body);

    if (response.statusCode == 201) {
      return true;
    } else {
      print("${response.reasonPhrase}  ${response.statusCode.toString()}");
      return false;
    }
  }

  ///fetch all reviews
  static dynamic getDiscountProduct() async {
    var headers = {'Content-Type': 'application/json'};
    var response =
        await client.get(Uri.parse(discountProductUrl), headers: headers);

    if (response.statusCode == 200) {
      return discountProductModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      print(response.statusCode);
    }
  }

  ///add user points
  static Future<bool> setUserPoints(
      {required int profileId, required int points}) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({"profile_ID": profileId, "points": points});

      var response = await client.post(Uri.parse(addPointUrl),
          headers: headers, body: body);

      if (response.statusCode == 202) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      return false;
      // TODO
    }
  }

  ///add user points
  static Future<bool> lossUserPoints(
      {required int profileId, required int points}) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({"profile_ID": profileId, "points": points});

      var response = await client.post(Uri.parse(lossPointUrl),
          headers: headers, body: body);

      if (response.statusCode == 202) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      return false;
      // TODO
    }
  }

  ///add user points
  static dynamic paymentProcess({required String accessToken}) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    var response = await client.get(Uri.parse(sslCommerzUrl), headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      print("this is response ${response.body}");
      var jsonData = json.decode(response.body);
      if (jsonData['GatewayPageURL'].toString() != "") {
        print(
            "$response and ${response.reasonPhrase} and ${jsonData['GatewayPageURL']}");
        return jsonData['GatewayPageURL'];
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
