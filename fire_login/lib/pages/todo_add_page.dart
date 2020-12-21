import 'package:fire_login/components/text_input.dart';
import 'package:fire_login/controllers/todo_controller.dart';
import 'package:fire_login/models/todo_model.dart';
import 'package:fire_login/services/app_pages.dart';
import 'package:fire_login/services/database.dart';
import 'package:fire_login/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoAddPage extends GetView<TodoController> {
  TextEditingController judulCont = TextEditingController(),
      isiCont = TextEditingController();

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
                // controller.signIn(_emailController.text, _passController.text);
                TodoModel todo = TodoModel(
                  isi: judulCont.text,
                  judul: isiCont.text,
                  kondisi: false,
                );
                Database().createTodoData(todo);
              },
              child: Text(
                "Save",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              color: primaryColor,
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
      appBar: AppBar(title: Text('TodoAddPage')),
      body: SingleChildScrollView(
        child: Container(
          decoration: kBoxDecoration,
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          margin: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              TextInput(
                label: "Judul",
                controller: judulCont,
                icon: Icons.email,
              ),
              TextInput(
                label: "Isi",
                icon: Icons.book,
                controller: isiCont,
              ),
              _btn(),
            ],
          ),
        ),
      ),
    );
  }
}
