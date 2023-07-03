class ProductModel {
  String name, image, description, size, price;


  ProductModel({
   required this.name,
    required  this.image,
    required this.description,
    required this.size,
    required this.price,

  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      image: json['image'],
      description: json['description'],
      size: json['size'],
      price: json['price'],

    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'image': image,
    'description': description,
    'size': size,
    'price': price,

  };
}