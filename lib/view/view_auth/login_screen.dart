import 'package:e_commerce_app/constance.dart';
import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:e_commerce_app/view/widgets/custom_social_button.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view/widgets/custom_text_form_filed.dart';
import 'package:e_commerce_app/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' show Color;

class LoginScreen extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50,
              right: 20,
              left:20 ,
            ),
            child: Column(
              children: [
                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      CustomText(
                        text: 'Welcome',
                        fontsize: 30,
                      ),
                      CustomText(
                        fontsize: 18,
                        text: 'Sign UP',
                        color: PrimayColor,
                      ),
                  ],

                ),
                SizedBox(height: 15,),
                CustomText(
                  color: Colors.grey,
                  text: 'Sign in to continue',
                  fontsize: 16,
                ),
                SizedBox(height: 30
                  ,),
                CustomText(
                  text: 'Email',
                  fontsize: 15,
                  color: Colors.grey.shade800,
                ),
                Custom_text_form_filed(
                  hint: 'mymail@gmail.com',
                  onSave: (value){},
                  validator: (value){},
                ),
                SizedBox( height:30,
                ),
                CustomText(
                  text: 'Password',
                  fontsize: 15,
                  color: Colors.grey.shade800,
                ),
                Custom_text_form_filed(
                  validator: (value){},
                  onSave: (value){},
                  hint: '**********',
                ),
                SizedBox( height:30,
                ),
                CustomText(text: 'Forget password?',
                fontsize: 16,
                  alignment: Alignment.bottomRight,
                  color: Colors.black,

                ),
                SizedBox(height: 20,
                ),
                CustomButton(
                  text: 'Sign In',
                  onpressed:(){

                  } ,
                ),
                SizedBox(height: 20,
                ),
                CustomText(
                  text: '-OR-',
                  alignment:Alignment.center ,
                ),
                SizedBox(height: 30,),
                custom_social_button(
                  onPressed:(){
                    controller.googleSignIn();},
                  text: 'Log in with Google',
                  imageName:'assets/images/google.png' ,
                ),
                SizedBox(height: 20,
                ),
                custom_social_button(
                  onPressed: (){
                    },
                  imageName: 'assets/images/facebook.png',
                  text: 'Log in with Facebook',
                ),

              ],

            ),
          ),
        ),
      ),
    );
  }
}






