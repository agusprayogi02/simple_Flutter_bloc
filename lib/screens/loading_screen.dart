import 'dart:convert';

import 'package:fire_bloc/models/models.dart';
import 'package:fire_bloc/screens/screens.dart';
import 'package:fire_bloc/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    this.getSession();
    super.initState();
  }

  void getSession() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    var session = _sharedPreferences.getString("session") ?? null;
    print("Log Sess: $session");
    if (session != null) {
      http.Response res = await postLogin(session);
      print("Isis");
      print("Log Sess: " + res.statusCode.toString());

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomeSiswaScreen(data: user);
            },
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return KonfirmasiScreen();
            },
          ),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return KonfirmasiScreen();
          },
        ),
      );
    }
  }

  Future<http.Response> postLogin(String id) {
    // Uri uri = Uri.http(apiUrl, '/user/login');
    return http.post(
      apiUrl + 'user/find',
      headers: {
        'content-type': "application/json",
      },
      body: jsonEncode(<String, String>{
        'id': id,
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Text("Loading..."),
          ],
        ),
      ),
    );
  }
}
