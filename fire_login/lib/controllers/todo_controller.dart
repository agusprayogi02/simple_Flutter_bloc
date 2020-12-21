import 'package:fire_login/models/todo_model.dart';
import 'package:fire_login/services/database.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  Rx<TodoModel> todo = TodoModel().obs;

  @override
  void onInit() {
    Database().getTodoAll();
    super.onInit();
  }
}
