import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  Future<String> registerUserWithEmail({
    required String email,
    required String pass,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      final user = _auth.currentUser;
      if (user == null) {
        return '';
      }
      return user.uid;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future<dynamic> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }

  bool isLogin() {
    return _checkUser();
  }

  bool _checkUser() {
    final user = _auth.currentUser;
    if (user == null) return false;
    return true;
  }

  Future<bool> registerUser({
    required Map<String, dynamic> data,
  }) async {
    if (!_checkUser()) return false;
    try {
      await _db.collection('users').doc(data['uid']).set(data);
      return true;
    } catch (e) {
      return false;
    }
  }
}
