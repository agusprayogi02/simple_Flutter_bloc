import 'package:fire_login/pages/home_page.dart';
import 'package:fire_login/pages/root_page.dart';
import 'package:fire_login/pages/signin_page.dart';
import 'package:fire_login/pages/signup_page.dart';
import 'package:fire_login/pages/todo_add_page.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => RootPage()),
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.LOGIN, page: () => SigninPage()),
    GetPage(name: Routes.SIGNUP, page: () => SignUpPage()),
    GetPage(name: Routes.ADDTODO, page: () => TodoAddPage()),
  ];
}
