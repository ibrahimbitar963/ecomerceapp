import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/user_model.dart';

class FireStoreUser {

  final CollectionReference _collectionReference =
  FirebaseFirestore.instance.collection('user');
        void addUserToFireStore(UserModel userModel) async{

          return await _collectionReference
              .doc(userModel.userId)
              .set(userModel.toJson());

        }


Future <DocumentSnapshot> getCurrentUser(String uid)async{
          return await _collectionReference.doc(uid).get();
}
}