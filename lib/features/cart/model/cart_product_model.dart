class CartProductModel {
  String name, image,  price , productId;
  int quantity;


  CartProductModel({
    required this.name,
    required  this.image,
    required this.price,
    required this.quantity,
    required this.productId,



  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      name: json['name'],
      image: json['image'],
     quantity: json['quantity'],
      price: json['price'],
      productId: json['productId']

    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'image': image,
    'price': price,
    'quantity':quantity,
    'productId':productId,

  };
}