import 'package:chardike/Service/ApiService/api_components.dart';
import 'package:chardike/screens/CategoryPage/controller/category_controller.dart';
import 'package:http/http.dart' as http;

import '../../screens/CategoryPage/model/brand_model.dart';
import '../../screens/CategoryPage/model/category_model.dart';
import '../../screens/HomePage/model/product_model.dart';

class ApiService{
  static var client = http.Client();

  static dynamic fetchCategories() async{
    var headers = {
      'Cookie': 'csrftoken=b5Agy7kbhlA1IR4YDJzOK3MUBty739mrPIbiepJxY6Na2bjbOPKG3GzodAWJLjIg'
    };
    var response = await client.get(Uri.parse(categoriesUrl),headers: headers);
    if(response.statusCode == 200){
      return categoryModelFromJson(response.body);
    }else{
      return response.statusCode;
    }
  }

  static dynamic fetchBrands() async{
    var headers = {
      'Cookie': 'csrftoken=b5Agy7kbhlA1IR4YDJzOK3MUBty739mrPIbiepJxY6Na2bjbOPKG3GzodAWJLjIg'
    };
    var response = await client.get(Uri.parse(brandUrl),headers: headers);
    if(response.statusCode == 200){
      return brandModelFromJson(response.body);
    }else{
      return response.statusCode;
    }
  }


  static dynamic fetchProducts() async{
    var headers = {
      'Cookie': 'csrftoken=b5Agy7kbhlA1IR4YDJzOK3MUBty739mrPIbiepJxY6Na2bjbOPKG3GzodAWJLjIg'
    };
    var response = await client.get(Uri.parse(productUrl),headers: headers);
    if(response.statusCode == 200){
      return productModelFromJson(response.body);
    }else{
      return response.statusCode;
    }
  }
}