import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/authintication/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../core/constants/screens_names.dart';
import '../../../core/sevices/cache_services.dart';
import '../../../core/sevices/user_firestore.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String name, email, password;

  void setFirebaseToken(String firebaseUserToken) async {
    await CacheHelper.setData(key: "firebase_token", value: firebaseUserToken);
  }

  void signInWithEmailAndPassword(BuildContext context) {
    emit(SignInLoadingState());

    try {
      _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        final userToken = await value.user!.getIdToken();
        setFirebaseToken(userToken);

        emit(SignInSuccessState());
        Navigator.pushNamed(context, ScreensNames.control);
      }).catchError((error) {
        emit(SignInErrorState());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void registerWithEmailAndPassword(BuildContext context) {
    emit(SignUpLoadingState());

    try {
      _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        final userToken = await user.user!.getIdToken();
        setFirebaseToken(userToken);
        UserModel userModel = UserModel(
            userId: user.user!.uid, name: name, email: email, photo: '');
        await UserFireStore().addUserToFireStore(userModel);

        emit(SignUpSuccessState());
        Navigator.pushNamed(context, ScreensNames.control);
      }).catchError((error) {
        emit(SignUpErrorState());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      });
    } catch (e) {
      print(e.toString());
    }
  }

}
