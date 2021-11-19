import 'package:e_commerce_app/view/view_auth/login_view.dart';
import 'package:e_commerce_app/view/widgets/home_view.dart';
import 'package:e_commerce_app/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ControlView extends GetWidget<AuthViewModel> {

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return (Get.find<AuthViewModel>().user!=null)
          ?HomeView()
          :LoginView();
    } );
  }
}
