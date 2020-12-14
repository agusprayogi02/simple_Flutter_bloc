import 'package:fire_login/controllers/auth_controller.dart';
import 'package:fire_login/views/home.dart';
import 'package:fire_login/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.user != null ? HomePage() : SignIn());
  }
}
