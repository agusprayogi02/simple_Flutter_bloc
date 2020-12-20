import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String uid;
  final String name;
  final String email;

  UserModel({this.uid, this.name, this.email});

  factory UserModel.documentSnapshot(DocumentSnapshot doc) {
    return UserModel(
      uid: doc.id,
      name: doc['name'],
      email: doc['email'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }

  @override
  // TODO: implement props
  List<Object> get props => [uid, name, email];
}
