import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './upload.dart';
import '../components/reusable_button.dart';
import './download.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Firebase Storage',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                'Welcome, Please select your option',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, UploadScreen.routeName);
              },
              minWidth: 200,
              child: const Text(
                'Upload Files',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.red,
            ),
            const SizedBox(
              height: 80,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, DownloadScreen.routeName);
              },
              minWidth: 200,
              child: const Text(
                'Download Files',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
