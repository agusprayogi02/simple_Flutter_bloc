import 'package:fire_login/components/text_input.dart';
import 'package:fire_login/controllers/auth_controller.dart';
import 'package:fire_login/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpPage extends GetView<AuthController> {
  TextEditingController _email = TextEditingController(),
      _pass = TextEditingController(),
      _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = Get.size.height, w = Get.size.width;
    return Scaffold(
      appBar: AppBar(title: Text('SignUpPage')),
      body: SingleChildScrollView(
          child: Container(
        height: h,
        width: w,
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
                            label: "Name",
                            controller: _name,
                            icon: Icons.person,
                          ),
                          TextInput(
                              label: "Email",
                              controller: _email,
                              icon: Icons.email),
                          TextInput(
                            label: "Password",
                            icon: Icons.lock,
                            controller: _pass,
                            isPass: true,
                            iconRight: Icon(Icons.visibility),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            height: 45,
                            width: double.infinity,
                            child: RaisedButton(
                              focusColor: Colors.blueGrey,
                              splashColor: Colors.blueGrey,
                              onPressed: () {
                                controller.signUp(
                                  _name.text,
                                  _email.text,
                                  _pass.text,
                                );
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              color: primaryColor,
                              textColor: white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
