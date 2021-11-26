import 'package:e_commerce_app/helper/local_sotrage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController{
final LocalStorageData localStorageData = Get.find();

  Future<void> singOut() async{
    await FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }
}