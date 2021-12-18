import 'package:e_commerce_app/helper/binding.dart';
import 'package:e_commerce_app/view/control_view.dart';
import 'package:e_commerce_app/view/view_auth/login_view.dart';
import 'package:e_commerce_app/viewmodel/auth_view_model.dart';
import 'package:e_commerce_app/viewmodel/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'helper/local_sotrage_data.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Get.put(CartViewModel());
  // Get.put(AuthViewModel());
  Get.put(LocalStorageData());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Scaffold(
        body: ControlView(),

      ),
      theme: ThemeData(
        fontFamily: 'SourceSans'
      ),
    );
  }
}
