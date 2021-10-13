// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:auth_dark/models/auth.dart';
import 'package:auth_dark/screens/auth_screen.dart';
import 'package:auth_dark/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';

class NavScreen extends StatefulWidget {
  static const String id = "nav_screen";
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  late StreamSubscription? deepLinkSubscription;

  @override
  void initState() {
    final provider = Provider.of<GitHubSignInProvider>(context, listen: false);

    deepLinkSubscription = linkStream.listen((String? link) {
      String code = getCodeFromGitHubLink(link!);
      provider.githubLogin(code);
    });

    super.initState();
  }

  String getCodeFromGitHubLink(String link) {
    if (link != null) {
      return link.substring(link.indexOf(RegExp('code=')) + 5);
    } else {
      return "";
    }
  }

  @override
  void dispose() {
    if (deepLinkSubscription != null) {
      deepLinkSubscription!.cancel();
      deepLinkSubscription = null;
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return HomeScreen();
          } else if (snapshot.hasError) {
            return Center(child: Text('Something Went Wrong'));
          }

          return AuthScreen();
        },
      ),
    );
  }
}
