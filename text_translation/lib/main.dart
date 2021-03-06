import 'package:flutter/material.dart';
import 'package:project_dsc/translator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColorDark: Colors.red[300],
      ),
      initialRoute: Translation.id,
      routes: {
        Translation.id: (context) => Translation(),
      },
    );
  }
}
