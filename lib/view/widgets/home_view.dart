import 'package:e_commerce_app/view/view_auth/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  FirebaseAuth  _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen'
        ) ,
      ),
      body: Center(
        child: FlatButton(
          child: Text('logout'),
          onPressed: (){
            _auth.signOut();
           Get.offAll(LoginView());
          },
        ),
      ),

    );
  }
}
