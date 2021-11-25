import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categorycollectionRef =
  FirebaseFirestore.instance.collection('Categories');
  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categorycollectionRef.get();

    return value.docs;
  }}
