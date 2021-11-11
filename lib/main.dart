import 'package:e_commerce_app/helper/binding.dart';
import 'package:e_commerce_app/view/view_auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
 await WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Scaffold(
        body: LoginScreen(

        ),
      ),
    );
  }
}
