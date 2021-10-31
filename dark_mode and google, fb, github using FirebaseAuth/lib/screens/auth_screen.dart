// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:auth_dark/models/auth.dart';
import 'package:auth_dark/widgets/sign_in_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  static const String id = "login_screen";

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign up with!",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 100),

              // Google Login
              SignInCard("Google", Colors.red, FontAwesomeIcons.google, () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);

                provider.googleLogin();
              }),
              SizedBox(height: 15),

              // Facebook Login
              SignInCard('Facebook', Colors.blue, FontAwesomeIcons.facebook,
                  () {
                final provider =
                    Provider.of<FacebookSignInProvider>(context, listen: false);

                provider.facebookLogin();
              }),
              SizedBox(height: 15),

              // Github Login
              SignInCard('GitHub', Color(0xFF333333), FontAwesomeIcons.github,
                  () {
                final provider =
                    Provider.of<GitHubSignInProvider>(context, listen: false);

                provider.opengithubLoginPage();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
