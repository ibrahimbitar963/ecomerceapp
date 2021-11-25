
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/service/home_service.dart';
import 'package:e_commerce_app/model/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
 ValueNotifier <bool> get loading =>_loading;
 ValueNotifier <bool> _loading = ValueNotifier(false);
  List <CategoryModel> get categortyModel => _categortyModel;
  List <CategoryModel> _categortyModel =[];

  HomeViewModel(){
    getCategory();
  }
  getCategory()async {
   loading.value= true;
   HomeService().getCategory().then((value) {
     for (int i =0; i<value.length; i++){
      _categortyModel.add(CategoryModel.fromJson(value[i].data()));
      loading.value= false;
     }

     update();}

    );
  }
}