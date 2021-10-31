import 'package:email_verification/src/authentication_feature/login.dart';
import 'package:email_verification/src/authentication_feature/verify_screen.dart';
import 'package:email_verification/src/sample_feature/sample_item_list_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthenticationService {
  final FirebaseAuth _auth;
  static User? user = FirebaseAuth.instance.currentUser;

  AuthenticationService(this._auth);

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushNamedAndRemoveUntil(
          context, SampleItemListView.routeName, (r) => false);
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.message.toString())));
    }
  }

  Future<String> signUp(
      {String? email, String? password, required BuildContext context}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
    } on FirebaseAuthException catch (e) {
      return '${e.message}';
    }
    User? user = _auth.currentUser;

    if (user != null && !user.emailVerified) {
      try {
        user.sendEmailVerification();
        Navigator.pushNamedAndRemoveUntil(
            context, VerifyScreen.routeName, (r) => false);
      } catch (error) {
        print(error);
      }
    }
    return '';
  }

  Future<void> signOut({required BuildContext context}) async {
    await _auth.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (r) => false);
  }
}
