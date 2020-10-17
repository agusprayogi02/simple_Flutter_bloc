import 'package:fire_bloc/screens/screens.dart';
import 'package:fire_bloc/utils/utils.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as client;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  Myapp({Key key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  SharedPreferences _preferences;

  @override
  void initState() async {
    _preferences = await SharedPreferences.getInstance();
    super.initState();
  }

  getUser() async {
    String session = _preferences.getString("userId");
    if (session != null) {
      Map<String, String> head = {"id": session};
      client.Response res =
          await client.get(apiUrl + "/user/find", headers: head);
    } else {
      return KonfirmasiScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryC,
        accentColor: lightC,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],
      home: getUser(),
    );
  }
}
