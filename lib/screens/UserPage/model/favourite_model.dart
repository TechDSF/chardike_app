class FavouriteModel {
  String id;
  String slug;
  String image;
  String name;
  String newPrice;
  String oldPrice;

  FavouriteModel(
      {required this.id,
      required this.slug,
      required this.image,
      required this.name,
      required this.newPrice,
      required this.oldPrice});

  factory FavouriteModel.fromJson(Map<String, dynamic> json) => FavouriteModel(
      id: json["id"],
      slug: json["slug"],
      image: json["image"],
      name: json["name"],
      newPrice: json["newPrice"],
      oldPrice: json["oldPrice"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "image": image,
        "name": name,
        "newPrice": newPrice,
        "oldPrice": oldPrice
      };
}
