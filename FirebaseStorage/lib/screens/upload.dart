import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../firebaseapi.dart';
import 'package:path/path.dart';
import '../components/reusable_button.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key key}) : super(key: key);
  static const routeName = '/uploadscreen';

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File file;

  Future selectFile() async {
    final pickedFile =
        await FilePicker.platform.pickFiles(allowMultiple: false);

    if (pickedFile == null) return;
    final path = pickedFile.files.single.path;

    setState(() {
      file = File(path);
    });
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file.path);
    final storeDestination = 'uploadedFile/$fileName';

    FirebaseApi.uploadFile(storeDestination, file);
    setState(() {
      file = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('UPLOAD'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableButton(
                  buttonText: 'Select File to Upload',
                  onPress: selectFile,
                ),
                file != null
                    ? const Text('File Selected')
                    : const Text('No file selected'),
                const SizedBox(
                  height: 35,
                ),
                ReusableButton(
                  buttonText: 'Upload File',
                  onPress: uploadFile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
