import 'package:firebase_auth/firebase_auth.dart';

class UserFirebase {
  final FirebaseAuth _firebaseAuth;

  UserFirebase()
      : _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signWithCredentials(String email, String password) {
    return _firebaseAuth
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        );
  }

  Future<FirebaseUser> signUp({String email, String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    return Future.wait([_firebaseAuth.signOut()]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<String> getUser() async {
    return (await _firebaseAuth.currentUser()).email;
  }

  Future<void> resetPassword({String email}){
    return Future.wait([_firebaseAuth.sendPasswordResetEmail(email: email)]);
  }
}
