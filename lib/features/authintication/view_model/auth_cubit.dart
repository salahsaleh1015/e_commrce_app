import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/constants/screens_names.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );
  late String name, email, password;

  // void signInWithEmailAndPassword(context) {
  //   emit(SignInLoadingState());
  //
  //   try {
  //     _auth
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         .then((value) {
  //       print(value);
  //       emit(SignInSuccessState());
  //       Navigator.pushNamed(context,ScreensNames.home );
  //     });
  //     emit(SignInErrorState());
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  void signInWithEmailAndPassword(BuildContext context) {
    emit(SignInLoadingState());

    try {
      _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print(value);
        emit(SignInSuccessState());
        Navigator.pushNamed(context, ScreensNames.home);
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

  // void registerWithEmailAndPassword(context) {
  //   emit(SignUpLoadingState());
  //   try {
  //     _auth
  //         .createUserWithEmailAndPassword(email: email, password: password)
  //         .then((value) {
  //       print(value);
  //       emit(SignUpSuccessState());
  //       Navigator.pushNamed(context,ScreensNames.home );
  //     });
  //   } catch (e) {
  //     emit(SignUpErrorState());
  //     print(e.toString());
  //   }
  // }
  void registerWithEmailAndPassword(BuildContext context) {
    emit(SignUpLoadingState());

    try {
      _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print(value);
        emit(SignUpSuccessState());
        Navigator.pushNamed(context, ScreensNames.home);
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

  void signInWithGoogleMethod(context) async {
    emit(GoogleSignInLoadingState());
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    await _auth.signInWithCredential(credential).then((value) {
      emit(GoogleSignInSuccessState());
      Navigator.pushNamed(context, ScreensNames.home);
    }).catchError((e) {
      emit(GoogleSignInErrorState());
      print(e.toString());
    });
  }
}
