import 'package:fire_login/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

// ignore: must_be_immutable
class SigninPage extends GetWidget<AuthController> {
  double w = Get.context.width, h = Get.context.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignIn"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: h * 0.2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                height: h * 0.5,
                width: w * 0.9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
