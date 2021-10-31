import 'package:flutter/material.dart';

import '../firebaseapi.dart';
import '../model/firebase_file.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key key}) : super(key: key);
  static const routeName = '/download';

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  Future<List<FirebaseFile>> listFiles;

  @override
  void initState() {
    super.initState();
    listFiles = FirebaseApi.listAll('uploadedFile/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('DOWNLOAD'),
      ),
      body: FutureBuilder<List<FirebaseFile>>(
          future: listFiles,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: const CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error has occured!'),
                  );
                } else {
                  final files = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: files.length,
                          itemBuilder: (context, index) {
                            final file = files[index];

                            return buildFile(context, file);
                          },
                        ),
                      )
                    ],
                  );
                }
            }
          }),
    );
  }

  Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
        leading: Image.network(
          file.url,
          width: 52,
          height: 52,
          fit: BoxFit.cover,
        ),
        title: Text(
          file.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            color: Colors.blue,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.file_download),
          onPressed: () async {
            await FirebaseApi.downloadFile(file.ref);
            const snackBar = const SnackBar(
                content: Text('Downloaded '
                    'Successfully'));

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
        /*onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ImagePage(file: file),
        )),*/
      );
}
