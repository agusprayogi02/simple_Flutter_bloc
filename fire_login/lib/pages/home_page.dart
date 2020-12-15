import 'package:fire_login/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hai"),
      ),
      body: Container(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              controller.user.email,
              style: TextStyle(fontSize: 20),
            ),
            Container(
              child: MaterialButton(
                color: Colors.blueAccent,
                textColor: Colors.white,
                splashColor: Colors.grey,
                child: Text("Logout"),
                onPressed: () => controller.logOut(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
