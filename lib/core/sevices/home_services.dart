


import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices{
  final CollectionReference _categoriesCollectionRef =
  FirebaseFirestore.instance.collection("Categories");
  final CollectionReference _productsCollectionRef =
  FirebaseFirestore.instance.collection("Products");

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoriesCollectionRef.get();
    return  value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProduct() async {
    var value = await _productsCollectionRef.get();
    return value.docs;
  }
}