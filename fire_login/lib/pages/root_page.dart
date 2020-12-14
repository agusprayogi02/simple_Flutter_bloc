import 'package:fire_login/controllers/auth_controller.dart';
import 'package:fire_login/pages/home_page.dart';
import 'package:fire_login/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class RootPage extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.user != null ? HomePage() : SignInPage());
  }
}
