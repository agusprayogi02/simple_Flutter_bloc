import 'package:fire_login/models/user_model.dart';
import 'package:firebase_database/firebase_database.dart';

class Database {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  Future<bool> createNewUser(UserModel user) async {
    print(user);
    try {
      await _database.child("users/").child(user.uid).set({
        "uid": user.uid,
        "name": user.name,
        "email": user.email,
      });
      // collection("users").doc(user.uid).set();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DataSnapshot doc = await _database.child("users").child(uid).once();
      UserModel user = UserModel.documentSnapshot(doc);
      return user;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
