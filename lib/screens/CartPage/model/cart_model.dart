class CartModel {
  String id;
  String title;
  String image;
  int quantity;
  double price;
  double totalPrice;
  int brandId;
  int categoryId;
  int totalQty;

  CartModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.quantity,
      required this.price,
      required this.totalPrice,
      required this.brandId,
      required this.categoryId,
      required this.totalQty});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
      id: json["id"],
      title: json['title'],
      image: json["image"],
      quantity: json['quantity'],
      price: json['price'],
      totalPrice: json['totalPrice'],
      brandId: json['brandId'],
      categoryId: json['categoryId'],
      totalQty: json['totalQnty']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "quantity": quantity,
        "price": price,
        "totalPrice": totalPrice,
        "brandId": brandId,
        "categoryId": categoryId,
        "totalQnty": totalQty
      };
}
