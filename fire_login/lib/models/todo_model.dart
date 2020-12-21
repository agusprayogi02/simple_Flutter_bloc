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

  List<TodoModel> listTodo(DataSnapshot list) {
    List<TodoModel> todoList;
    if (list.value != null) {
      var data = list.value;
      for (var i in data) {
        TodoModel todo = TodoModel(
          id: data[list.key],
          judul: data[list.key]['judul'],
          isi: data[list.key]['isi'],
          kondisi: data[list.key]['kondisi'],
        );
        todoList.add(todo);
      }
    }
    return todoList;
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
