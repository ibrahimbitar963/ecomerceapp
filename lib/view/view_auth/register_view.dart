import 'package:e_commerce_app/view/view_auth/login_view.dart';
import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:e_commerce_app/view/widgets/custom_social_button.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view/widgets/custom_text_form_filed.dart';
import 'package:e_commerce_app/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart ';
import 'package:get/get.dart';

import '../../constance.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Get.to(LoginView());
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50,
              right: 20,
              left: 20,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomText(
                    text: 'SignUp',
                    fontsize: 30,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomText(
                    text: 'Name',
                    fontsize: 15,
                    color: Colors.grey.shade800,
                  ),
                  Custom_text_form_filed(
                    hint: 'myName',
                    onSave: (value) {
                      controller.name = value;
                    },
                    validator: (value) {
                      if (value == null) {}
                      print('error');
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomText(
                    text: 'Email',
                    fontsize: 15,
                    color: Colors.grey.shade800,
                  ),
                  Custom_text_form_filed(
                    hint: 'mymail@gmail.com',
                    onSave: (value) {
                      controller.email = value;
                    },
                    validator: (value) {
                      if (value == null) {}
                      print('error');
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomText(
                    text: 'Password',
                    fontsize: 15,
                    color: Colors.grey.shade800,
                  ),
                  Custom_text_form_filed(
                    validator: (value) {
                      if (value == null) {}
                      print('error');
                    },
                    onSave: (value) {
                      controller.password = value;
                    },
                    hint: '**********',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                      text: 'Sign UP',
                      onpressed: () {
                        _formKey.currentState.save();
                        controller.signUp();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
