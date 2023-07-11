import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../features/authintication/model/user_model.dart';
import '../../features/check_out/model/checkout_model.dart';


class UserFireStore {
  final CollectionReference _userCollectionRef =
  FirebaseFirestore.instance.collection("Users");

  Future<void> addUserToFireStore(UserModel userModel)async{

    return  await _userCollectionRef.doc(userModel.userId).set(userModel.toJson());
  }

  Future<void> addCheckoutData(CheckOutModel checkOutModel) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await _userCollectionRef
        .doc(userId)
        .collection('Checkouts')
        .add(checkOutModel.toJson());

  }

  Future<CheckOutModel?> getLatestCheckoutData() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    try {
      QuerySnapshot querySnapshot = await _userCollectionRef
          .doc(userId)
          .collection('Checkouts')
          .orderBy('timestamp', descending: true)
          .limit(1)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        return CheckOutModel.fromJson(querySnapshot.docs.first.data() as Map<String , dynamic>);
      }
    } catch (e) {
      print('Error getting latest checkout data: $e');
    }

    return null;
  }


}