import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:godofdiscipline/models/AppUser/app_user.dart';

class UserService {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  String _getUserId() {
    final user = _auth.currentUser;
    if (user == null) return '';
    return user.uid;
  }

  Future<bool> updateUserData(Map<String, dynamic> data) async {
    try {
      final uid = _getUserId();
      if (uid.isEmpty) return false;
      await _db.collection('users').doc(uid).update(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<AppUser?> getUserData() async {
    final uid = _getUserId();
    try {
      final response = await _db.collection('users').doc(uid).get();
      final userData = response.data();
      if (userData == null) return null;
      return AppUser.fromJson(userData);
    } catch (e) {
      return null;
    }
  }

  Future<bool> updateUserLevel(
      {required Map<String, dynamic> data, required String uid}) async {
    try {
      await _db.collection('users').doc(uid).update({
        'level': data,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> updateSearchHistory(
      List<dynamic> searchHistory, String uid) async {
    try {
      await _db.collection('users').doc(uid).update({
        'searchHistory': searchHistory,
      });
    } catch (_) {}
  }
}
