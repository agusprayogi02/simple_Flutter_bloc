import 'dart:ui';

import 'package:fire_login/components/text_box.dart';
import 'package:fire_login/controllers/auth_controller.dart';
import 'package:fire_login/controllers/todo_controller.dart';
import 'package:fire_login/services/app_pages.dart';
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
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.red,
                ),
              ),
              child: GetX<TodoController>(
                init: TodoController(),
                builder: (_) {
                  return _.listTodo.value.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                            height: 1,
                          ),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            var val = _.listTodo.value[index];
                            return TextBox(
                              title: val.judul,
                              subTitle: val.isi,
                              enable: val.kondisi,
                              onChanged: (value) {},
                            );
                          },
                        );
                },
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                    color: Colors.redAccent,
                    onPressed: () => Get.toNamed(Routes.ADDTODO),
                    child: Text("Coba"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
