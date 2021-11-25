import 'package:e_commerce_app/core/service/firestore_user.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/view/widgets/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String email;
  String name;
  String password;
  Rx<User> _user = Rx<User>();
  get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  // void signup()  async {
  // UserCredential userCredential = await
  // FirebaseAuth.instance.createUserWithEmailAndPassword(
  // email: email,
  // password: password,
  // ); Get.offAll(HomeView());
  // }  FirebaseAuthException  (e) {
  // if (e.code == 'weak-password') {
  // print('The password provided is too weak.');
  // } else if (e.code == 'email-already-in-use') {
  // print('The account already exists for that email.');
  // }
  // }
  //
//
//
//
//
//
  void sign() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: "barry.allen@example.com",
              password: "SuperSecretPassword!");
      Get.offAll(HomeView());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void signUp() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((user)async{
            await FireStoreUser().addUserToFireStore(UserModel(
              userId: user.user.uid,
              email:user.user.email,
              name:name,
              pic:'',
            ));
          });
      Get.offAll(HomeView());
      print(userCredential);
    } catch (e) {
      print(e);
    }
  }

  void anonymousSignin() async {
    UserCredential userCredential = await _auth.signInAnonymously();
    Get.offAll(HomeView());
    print(userCredential);
  }
  void saveUser(UserCredential userCredential) async{
    await FireStoreUser().addUserToFireStore(UserModel(
        userId: user.user.uid,
        email:user.user.email,
        name:name,
        pic:'',
    ));
  }
}
