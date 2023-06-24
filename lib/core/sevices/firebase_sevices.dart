import 'package:firebase_auth/firebase_auth.dart';
class MyUser
{
  final String uid;
  MyUser({required this.uid});
}
class FirebaseService {


  // get user stream
  Stream<User?> get userStream
  {
    return FirebaseAuth.instance.authStateChanges();
  }

  // login with email and password
  Future<UserCredential> login(String email, String password) async
  {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  // register with email and password

  Future<UserCredential> register(String email, String password) async
  {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  // logout
  Future<void> logout() async
  {
    await FirebaseAuth.instance.signOut();
  }

  // get current user

  Future<User?> getCurrentUser() async
  {
    User? user = FirebaseAuth.instance.currentUser;
    return user;
  }
}