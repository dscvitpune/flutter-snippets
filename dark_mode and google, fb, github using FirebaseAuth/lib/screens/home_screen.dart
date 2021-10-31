// ignore_for_file: prefer_const_constructors

import 'package:auth_dark/constants.dart';
import 'package:auth_dark/models/auth.dart';
import 'package:auth_dark/models/change_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _value = false;
  final user = FirebaseAuth.instance.currentUser!;

  void _changeTheme(bool val) {
    setState(() {
      _value = val;
      Provider.of<ChangeTheme>(context, listen: false).changeTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    String platform =
        FirebaseAuth.instance.currentUser!.providerData[0].providerId;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth Test"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              Switch(
                value: _value,
                onChanged: _changeTheme,
              ),
              Text(
                'Switch to ' + (_value ? 'Light' : 'Dark') + ' Mode',
                style: homeScreenTextStyle,
              ),
              SizedBox(height: 60),
              Text(
                'Profile',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              SizedBox(height: 10),
              Text(
                'Name: ' + user.displayName!,
                style: homeScreenTextStyle,
              ),
              SizedBox(height: 5),
              Text(
                'Email: ' + user.email!,
                style: homeScreenTextStyle,
              ),
              SizedBox(height: 5),
              Text(
                'Logged In through: ' + platform,
                style: homeScreenTextStyle,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  final provider;

                  if (platform == 'google.com') {
                    provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);

                    provider.googleLogOut();
                  } else if (platform == 'facebook.com') {
                    provider = Provider.of<FacebookSignInProvider>(context,
                        listen: false);

                    provider.facebookLogOut();
                  } else if (platform == 'github.com') {
                    provider = Provider.of<GitHubSignInProvider>(context,
                        listen: false);

                    provider.githubLogOut();
                  }
                },
                child: Text('LogOut'),
              ),
              ElevatedButton(
                onPressed: () {
                  try {
                    FirebaseAuth.instance.currentUser!.delete();
                  } catch (e) {
                    showToast(e.toString());
                  }
                },
                child: Text('Delete Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
