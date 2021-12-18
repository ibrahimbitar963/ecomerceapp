import 'package:e_commerce_app/helper/local_sotrage_data.dart';
import 'package:e_commerce_app/view/widgets/home_view.dart';
import 'package:e_commerce_app/viewmodel/auth_view_model.dart';
import 'package:e_commerce_app/viewmodel/cart_view_model.dart';
import 'package:e_commerce_app/viewmodel/control_view_model.dart';
import 'package:e_commerce_app/viewmodel/home_view_model.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
     Get.lazyPut(() => (AuthViewModel()));
    Get.lazyPut(() => (ControlViewModel()));
    Get.lazyPut(() => (HomeViewModel()));
    Get.lazyPut(() => (LocalStorageData()));
    Get.lazyPut(() => (CartViewModel()));

  }

}