// ignore_for_file: prefer_const_constructors

import 'package:auth_dark/models/change_theme.dart';
import 'package:auth_dark/screens/nav_screen.dart';
import 'package:auth_dark/screens/home_screen.dart';
import 'package:auth_dark/screens/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChangeTheme()),
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (context) => FacebookSignInProvider()),
        ChangeNotifierProvider(create: (context) => GitHubSignInProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ChangeTheme>(context).isDarkTheme
          ? ThemeData.dark()
          : ThemeData(primarySwatch: Colors.blue),
      initialRoute: NavScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        AuthScreen.id: (context) => const AuthScreen(),
        NavScreen.id: (context) => const NavScreen(),
      },
    );
  }
}
