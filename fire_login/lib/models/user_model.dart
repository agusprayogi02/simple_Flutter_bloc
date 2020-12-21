import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';

class UserModel extends Equatable {
  final String uid;
  final String name;
  final String email;

  UserModel({this.uid, this.name, this.email});

  factory UserModel.documentSnapshot(DataSnapshot doc) {
    return UserModel(
      uid: doc.key,
      name: doc.value['name'],
      email: doc.value['email'],
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
