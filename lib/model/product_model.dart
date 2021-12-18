import 'dart:ui';

class ProductModel {
  String name, image, description, Sized, price,color,productID;

  ProductModel(
      {this.name,
        this.image,
        this.description,
        this.color,
        this.Sized,
        this.price,
        this.productID});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = map['color'];
    Sized = map['Sized'];
    price = map['price'];
    productID = map['productID'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'Sized': Sized,
      'price': price,
      'productID':productID
    };
  }
}
