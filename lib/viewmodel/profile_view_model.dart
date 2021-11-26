import 'package:e_commerce_app/helper/local_sotrage_data.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController{
ValueNotifier <bool> get loading => _loading;
ValueNotifier<bool> _loading = ValueNotifier(false);
final LocalStorageData localStorageData = Get.find();
UserModel get userModel => _userModel;
UserModel _userModel;
@override
void onInit() {
  // TODO: implement onInit
  super.onInit();
  getCurrentUser();
}
  Future<void> singOut() async{
    await FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }
  void getCurrentUser() async{
  _loading.value=true;
    await localStorageData.getUser.then((value) {
      _userModel = value;
    });
  _loading.value=false;
    update();
  }
}