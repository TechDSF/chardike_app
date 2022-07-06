class CartModel {
  String title;
  String image;
  int quantity;
  double price;
  double totalPrice;

  CartModel(
      {required this.title,
      required this.image,
      required this.quantity,
      required this.price,
      required this.totalPrice});
}
