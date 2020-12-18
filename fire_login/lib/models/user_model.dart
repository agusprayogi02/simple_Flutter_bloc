import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String name;
  String email;

  UserModel({id = "", name = "", email = ""});

  UserModel.documentSnapshot(DocumentSnapshot doc) {
    this.uid = doc.data()['uid'];
    this.name = doc.data()['name'];
    this.email = doc.data()['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
