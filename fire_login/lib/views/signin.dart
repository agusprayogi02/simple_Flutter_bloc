import 'package:fire_login/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SignIn extends GetWidget<AuthController> {
  double height, width;
  @override
  Widget build(BuildContext context) {
    height = Get.context.height;
    width = Get.context.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("SignIn"),
      ),
      body: Stack(
        children: [
          Container(
            width: width * 0.9,
            height: height * 0.5,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
