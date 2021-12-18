import 'package:e_commerce_app/database/cart_database_helper.dart';
import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;
  double get totalPrice => _totalPrice;
  double _totalPrice = 0;
  var dbHelper = CartDatabaseHelper.db;
  getAllProduct() async {
    _loading.value = true;

    _cartProductModel = await dbHelper.getAllProducts();
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity;
      print(_totalPrice);
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for(int i =0;i<_cartProductModel.length;i++){
      if(_cartProductModel[i].productID==cartProductModel.productID){
        return;
      }
    }

    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice += double.parse(cartProductModel.price) *
        cartProductModel.quantity;

    update();
  }
  increaseQuantity(int index)async{
    _cartProductModel[index].quantity++;

    _totalPrice +=
    (double.parse(_cartProductModel[index].price));
  await  dbHelper.updateDataBase(_cartProductModel[index]);
    update();

  }
  decreaseQuantity(int index)async{
    _cartProductModel[index].quantity--;

    _totalPrice -=
    (double.parse(_cartProductModel[index].price));
    await  dbHelper.updateDataBase(_cartProductModel[index]);

    update();

  }

  CartViewModel() {
    getAllProduct();
  }


}
