import 'package:fire_login/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<UserModel> _user = UserModel().obs;

  UserModel get user => _user.value;

  set user(UserModel val) => this._user.value = val;

  void clear() {
    _user.value = UserModel();
  }
}
