import 'dart:async';
import 'package:email_verification/src/sample_feature/sample_item_list_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);
  static const routeName = '/verifyScreen';

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Timer? timer;
  User? user;
  @override
  void initState() {
    user = _auth.currentUser;

    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      isUserVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  Future<void> isUserVerified() async {
    user = _auth.currentUser;
    await user!.reload();
    if (user!.emailVerified) {
      timer!.cancel();
      Navigator.pushNamed(context, SampleItemListView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SpinKitWave(
              color: Colors.blue,
              size: 50,
            ),
            SizedBox(height: 50),
            Text("We are verifying your email please wait"),
          ],
        ),
      ),
    );
  }
}
