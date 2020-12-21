import 'package:fire_login/models/todo_model.dart';
import 'package:fire_login/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Database {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future<bool> createTodoData(TodoModel todo) async {
    try {
      await _database
          .child("users")
          .child(_auth.currentUser.uid)
          .child("todos")
          .push()
          .set({
        "isi": todo.isi,
        "judul": todo.judul,
        "kondisi": todo.kondisi,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<TodoModel> getTodo(String uid) async {
    try {
      TodoModel todoModel;
      var stream = _database
          .child("users/todos")
          .child(uid)
          .onChildChanged
          .listen((event) {});

      return todoModel;
    } catch (e) {
      print(e);
      return TodoModel();
    }
  }

  Stream<List<TodoModel>> getTodoAll(String uid) {
    return _database
        .child("users")
        .child(uid + "/todos")
        .onChildChanged
        .map((element) {
      Map<dynamic, dynamic> isi = element.snapshot.value;
      List<TodoModel> listTodo = <TodoModel>[];
      isi.forEach((key, value) {
        listTodo.add(value);
      });
      return listTodo;
    });
  }
}
