import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_login/models/user_model.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.uid).set(user.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("users").doc(uid).get();
      UserModel user = UserModel.documentSnapshot(doc);
      return user;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
