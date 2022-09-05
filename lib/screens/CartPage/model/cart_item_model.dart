import 'dart:convert';

class CartItemModel {
  final String item;
  final String quantity;
  final String attr;
  final String amount_item;
  final String total_price;

  CartItemModel(
      {required this.item,
      required this.quantity,
      required this.attr,
      required this.amount_item,
      required this.total_price});

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
        item: json['item'],
        quantity: json['quantity'],
        attr: json['attr'],
        amount_item: json['amount_item'],
        total_price: json['total_price']);
  }

  Map<String, dynamic> toJson() {
    return {
      "item": this.item,
      "quantity": this.quantity,
      "attr": this.attr,
      "amount_item": this.amount_item,
      "total_price": this.total_price
    };
  }
}

String convertToJson(List<CartItemModel> items) {
  List<Map<String, dynamic>> jsonData = items.map((e) => e.toJson()).toList();
  return jsonEncode(jsonData);
}

