import 'package:firebase_login/Home.dart';
import 'package:firebase_login/LoginPage.dart';
import 'package:firebase_login/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Login',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        "/register": (context) => RegisterPage(),
        "/home": (context) => Home(),
        "/login": (context) => LoginPage()
      },
    );
  }
}