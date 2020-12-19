import 'dart:ui';

import 'package:fire_login/components/text_box.dart';
import 'package:fire_login/controllers/auth_controller.dart';
import 'package:fire_login/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePage extends GetWidget<AuthController> {
  double h = Get.height, w = Get.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Home"),
            MaterialButton(
              focusColor: Colors.blueGrey,
              splashColor: Colors.blueGrey,
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => controller.logOut(),
            )
          ],
        ),
      ),
      body: Container(
        width: w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: w * 0.9,
              height: h * 0.8,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.red,
                ),
              ),
              child: GetBuilder<UserController>(
                init: UserController(),
                builder: (val) => ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return TextBox(
                      title: "aku",
                      subTitle: "kamu",
                      enable: false,
                      onChanged: (v) {},
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
