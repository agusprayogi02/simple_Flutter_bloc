import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';

class TodoModel extends Equatable {
  final String id;
  final String judul;
  final String isi;
  final bool kondisi;

  TodoModel({
    this.id,
    this.judul,
    this.isi,
    this.kondisi,
  });

  factory TodoModel.documentSnapshot(DataSnapshot doc) {
    return TodoModel(
      id: doc.key,
      judul: doc.value['judul'],
      isi: doc.value['isi'],
      kondisi: doc.value['kondisi'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['judul'] = this.judul;
    data['isi'] = this.isi;
    data['kondisi'] = this.kondisi;
    return data;
  }

  @override
  // TODO: implement props
  List<Object> get props => [id, judul, isi, kondisi];
}
