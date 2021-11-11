import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthViewModel extends GetxController{

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth  _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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
void googleSignIn() async{
    final GoogleSignInAccount googleUser= await _googleSignIn.signIn();
     GoogleSignInAuthentication googleSignInAuthentication =
    await googleUser.authentication;

  final AuthCredential credential=   GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

  UserCredential userCredential=  await _auth.signInWithCredential(credential);
  print(userCredential.user);
}
// void facebookSignIn() async{
//   FacebookLoginResult result = await _facebookLogin.logIn(['email']);
//   final accessToken = result.accessToken.token;
//   if(result.status == FacebookLoginStatus.loggedIn){
//     final faceCredential = FacebookAuthProvider.credential(accessToken);
//     await _auth.signInWithCredential(faceCredential);
//   }

// }
}
