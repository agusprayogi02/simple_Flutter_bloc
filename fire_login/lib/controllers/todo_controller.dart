import 'dart:async';

import 'package:fire_login/models/todo_model.dart';
import 'package:fire_login/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  Rx<TodoModel> todo = TodoModel().obs;
  Rx<List<TodoModel>> listTodo = Rx<List<TodoModel>>();
  DatabaseReference database = FirebaseDatabase.instance.reference();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    String uid = auth.currentUser.uid;
    listTodo.bindStream(Database().getTodoAll(uid));
    super.onInit();
  }
}
