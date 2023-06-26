import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/authintication/model/user_model.dart';


class UserFireStore {
  final CollectionReference _userCollectionRef =
  FirebaseFirestore.instance.collection("Users");

  Future<void> addUserToFireStore(UserModel userModel)async{

    return  await _userCollectionRef.doc(userModel.userId).set(userModel.toJson());
  }
}