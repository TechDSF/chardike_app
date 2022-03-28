class ProductModel{
  List<String> image;
  String title;
  double rating;
  int totalRating;
  int totalSold;
  int price;
  int cutPrice;
  int discount;
  bool isFree;
  String shoppingFrom;
  String shoppingFee;

  ProductModel({
    required this.title,
    required this.image,
    required this.rating,
    required this.totalRating,
    required this.totalSold,
    required this.price,
    required this.cutPrice,
    required this.discount,
    required this.isFree,
    required this.shoppingFrom,
    required this.shoppingFee
});
}