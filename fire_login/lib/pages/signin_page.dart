import 'package:fire_login/components/text_input.dart';
import 'package:fire_login/controllers/auth_controller.dart';
import 'package:fire_login/models/todo_model.dart';
import 'package:fire_login/services/app_pages.dart';
import 'package:fire_login/services/database.dart';
import 'package:fire_login/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class SigninPage extends GetWidget<AuthController> {
  double w = Get.context.width, h = Get.context.height;
  TextEditingController _emailController = TextEditingController(),
      _passController = TextEditingController();

  Widget _btn() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 45,
            child: RaisedButton(
              focusColor: Colors.blueGrey,
              splashColor: Colors.blueGrey,
              onPressed: () {
                controller.signIn(_emailController.text, _passController.text);
                // TodoModel todo = TodoModel(
                //   id: Uuid().v4(),
                //   isi: _emailController.text,
                //   judul: _passController.text,
                //   kondisi: false,
                // );
                // Database().createTodoData(todo);
              },
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              color: primaryColor,
              textColor: white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
            ),
          ),
          SizedBox(
            height: 45,
            child: RaisedButton(
              focusColor: Colors.blueGrey,
              splashColor: Colors.blueGrey,
              onPressed: () {
                Get.toNamed(Routes.SIGNUP);
              },
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              color: masukC,
              textColor: white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignIn"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: h,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: h * 0.53,
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text("Welcome To Fire Login", style: txtStyle),
                  ),
                  Container(
                    decoration: kBoxDecoration,
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    margin: EdgeInsets.all(30),
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: <Widget>[
                          TextInput(
                            label: "Email",
                            controller: _emailController,
                            icon: Icons.email,
                          ),
                          TextInput(
                            label: "Password",
                            icon: Icons.lock,
                            controller: _passController,
                            isPass: true,
                            iconRight: Icon(Icons.visibility),
                          ),
                          _btn(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
