import 'package:firebase_auth/firebase_auth.dart';
import 'package:message/core/model/user.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Users _userFromFirebase(User user) {
    //return
    if (user != null) {
      return Users(userId: user.uid);
    } else {
      return null;
    }
  }

  Stream<Users> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  Future signinwithemail(String email, String password) async {
    try {
      UserCredential _result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = _result.user;
      return _userFromFirebase(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signupWithEmail(String email, String password) async {
    try {
      UserCredential _result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = _result.user;
      return _userFromFirebase(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }
}
