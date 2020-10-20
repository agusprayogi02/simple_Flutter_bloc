import 'dart:convert';

import 'package:fire_bloc/models/models.dart';
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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: KonfirmasiScreen(),
    );
  }
}
