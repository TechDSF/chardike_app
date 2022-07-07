class CartModel {
  String id;
  String title;
  String image;
  int quantity;
  double price;
  double totalPrice;

  CartModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.quantity,
      required this.price,
      required this.totalPrice});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
      id: json["id"],
      title: json['title'],
      image: json["image"],
      quantity: json['quantity'],
      price: json['price'],
      totalPrice: json['totalPrice']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "quantity": quantity,
        "price": price,
        "totalPrice": totalPrice
      };
}
