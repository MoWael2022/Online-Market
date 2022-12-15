class Products {
  final int id;
  final String title;
  final String description;
  final int price;
  final String brand;
  final String Image;
  final String category;
  final List<dynamic> ImagesProduct;
  final dynamic rate;
  final dynamic stock;
  final dynamic discountPercentage;

  Products(
      {required this.id,
      required this.ImagesProduct,
      required this.brand,
      required this.discountPercentage,
      required this.stock,
      required this.title,
      required this.description,
      required this.price,
      required this.rate,
      required this.Image,
      required this.category});

  factory Products.fromjson(Map<String, dynamic> json, int i) {
    return Products(
      id: json['products'][i]['id'],
      title: json['products'][i]['title'],
      description: json['products'][i]["description"],
      price: json['products'][i]["price"],
      brand: json['products'][i]["brand"],
      Image: json['products'][i]["thumbnail"],
      category: json['products'][i]["category"],
      ImagesProduct: json['products'][i]["images"],
      rate:  json['products'][i]["rating"],
      discountPercentage:  json['products'][i]["discountPercentage"],
      stock:  json['products'][i]["stock"],
    );
  }
}
