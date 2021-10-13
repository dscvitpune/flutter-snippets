import 'dart:convert';
import 'package:auth_dark/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) return;

      _user = googleUser;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } on PlatformException catch (e) {
      showToast(e.toString());
    } catch (e) {
      showToast(e.toString());
    }

    notifyListeners();
  }

  Future googleLogOut() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}

class FacebookSignInProvider extends ChangeNotifier {
  Future facebookLogin() async {
    try {
      final facebookLoginResult = await FacebookAuth.instance.login();

      final userData = await FacebookAuth.instance.getUserData();
      // Add 'await' before FacebookAuthProvider.credential before an error occurs
      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);

      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      showToast(e.toString());
    }

    notifyListeners();
  }

  Future facebookLogOut() async {
    await FacebookAuth.instance.logOut();
    FirebaseAuth.instance.signOut();
  }
}

class GitHubSignInProvider extends ChangeNotifier {
  static const String CLIENT_ID = "094976199fd0d8425183";
  static const String CLIENT_SECRET =
      "bb2cd118903e98909cc4a3efe2913ac9492d9f08";

  Future opengithubLoginPage() async {
    const String url = "https://github.com/login/oauth/authorize?client_id=" +
        CLIENT_ID +
        "&scope=user:email";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showToast('Could not launch GitHub. Please Try again');
    }
  }

  void githubLogin(String code) async {
    try {
      final response = await http.post(
        Uri.parse("https://github.com/login/oauth/access_token"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: "{\"client_id\":\"" +
            CLIENT_ID +
            "\",\"client_secret\":\"" +
            CLIENT_SECRET +
            "\",\"code\":\"" +
            code +
            "\"}",
      );

      final AuthCredential credential = GithubAuthProvider.credential(
        json.decode(response.body)['access_token'],
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      showToast(e.toString());
    }
  }

  Future githubLogOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
