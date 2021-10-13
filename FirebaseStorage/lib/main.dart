import 'package:dscproject/screens/home.dart';
import 'package:flutter/material.dart';

import 'screens/upload.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/download.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screens',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        UploadScreen.routeName: (context) => const UploadScreen(),
        DownloadScreen.routeName: (context) => const DownloadScreen(),
      },
    );
  }
}
