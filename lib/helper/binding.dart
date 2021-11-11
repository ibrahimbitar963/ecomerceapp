import 'package:e_commerce_app/viewmodel/auth_view_model.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => (AuthViewModel()));
  }

}