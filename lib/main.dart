// ignore_for_file: prefer_const_constructor, prefer_const_constructors

import 'package:copy_of_margdrashak/firebase_options.dart';
import 'package:copy_of_margdrashak/bottom_navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/liquid swipe/swipe_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreferences pref = await SharedPreferences.getInstance();

  print(pref.getBool('login'));

  runApp(MaterialApp(
    theme: ThemeData.light(),
    debugShowCheckedModeBanner: false,
    title: 'Helping students to get their interview cleared',
    home: pref.getBool('login') == false || pref.getBool('login') == null
        ? SwipePages()
        : BottomNavigation(),
  ));
}
