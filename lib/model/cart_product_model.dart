import 'dart:ui';

class CartProductModel {
  String name, image,  price,productID;
  int quantity;

  CartProductModel(
      {this.name,
        this.image,
        this.price,
        this.quantity,
        this.productID
      });

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    quantity= map['quantity'];
    price = map['price'];
    productID = map['productID'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity':quantity,
      'price': price,
      'productID':productID,
    };
  }
}
