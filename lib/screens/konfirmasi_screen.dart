import 'dart:convert';

import 'package:fire_bloc/models/models.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:fire_bloc/components/components.dart';
import 'package:fire_bloc/screens/screens.dart';
import 'package:fire_bloc/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class KonfirmasiScreen extends StatefulWidget {
  KonfirmasiScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _KonfirmasiScreenState createState() => _KonfirmasiScreenState();
}

class _KonfirmasiScreenState extends State<KonfirmasiScreen> {
  String email;
  String err;
  DateFormat _dateFormat = DateFormat.yMMMd();
  String password;
  SharedPreferences _session;
  LocationPermission permission;

  @override
  void initState() {
    super.initState();
    password = new DateTime.now().toString().split(" ")[0];
    this._getPerMission();
  }

  _getPerMission() async {
    permission = await Geolocator.checkPermission();
    print(permission);
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
    }
  }

  void login() async {
    _session = await SharedPreferences.getInstance();
    if (email == null) {
      err = "Email Tidak Boleh Kosong";
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text(err),
          actions: [
            FlatButton(
                onPressed: () => Navigator.pop(context), child: Text("Ok"))
          ],
        ),
      );
    } else if (password == null) {
      err = "Password Harus diisi!";
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text(err),
          actions: [
            FlatButton(
                onPressed: () => Navigator.pop(context), child: Text("Ok"))
          ],
        ),
      );
    } else {
      http.Response res = await postLogin();
      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body)['value']);
        _session.setString("session", user.id);
        print("log: " + user.id);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomeSiswaScreen(data: user);
            },
          ),
        );
      } else {
        err = "NSIN atau Tanggal Tidak valid!";
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Error"),
            content: Text(err),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.pop(context), child: Text("Ok"))
            ],
          ),
        );
      }
    }
  }

  Future<http.Response> postLogin() {
    // Uri uri = Uri.http(apiUrl, '/user/login');
    return http.post(
      apiUrl + 'user/login',
      headers: {
        'content-type': "application/json",
      },
      body: jsonEncode(<String, String>{
        'user': email,
        'pass': password,
      }),
    );
  }

  Widget _btnLogin() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: double.infinity,
      height: 45,
      child: RaisedButton(
        onPressed: () {
          login();
        },
        child: Text(
          "Submit",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        color: primaryC,
        textColor: whiteC,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2 + 50,
            decoration: BoxDecoration(
              color: primaryC,
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
                margin: EdgeInsets.only(top: 20),
                child: Text("Login", style: txtStyle),
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
                          label: "NISN",
                          type: TextInputType.number,
                          onChange: (value) => {
                            setState(() => {email = value})
                          },
                          icon: Icons.person,
                        ),
                        InputDatePicker(
                          labelText: "Tanggal Lahir",
                          prefixIcon: Icon(Icons.date_range),
                          suffixIcon: Icon(Icons.arrow_drop_down),
                          dateFormat: _dateFormat,
                          lastDate: DateTime.now().add(Duration(days: 1)),
                          firstDate: DateTime.parse("1900-01-01"),
                          initialDate: DateTime.now(),
                          onDateChanged: (selectedDate) {
                            List<String> _date =
                                selectedDate.toString().split(" ");
                            password = _date[0];
                            setState(() {});
                          },
                        ),
                        _btnLogin(),
                      ],
                    ),
                  )),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Text(password ?? ""),
            ),
          )
        ],
      ),
    );
  }
}
