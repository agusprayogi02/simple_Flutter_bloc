import 'package:fire_login/models/todo_model.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  Rx<TodoModel> todo = TodoModel().obs;
}
