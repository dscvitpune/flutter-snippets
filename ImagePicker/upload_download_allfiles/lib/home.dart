import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:core';






class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File _imageFile;
  bool _uploaded = false;
  StorageReference _reference = FirebaseStorage.instance.ref().child('myimage.jpg');
  String _downloadUrl;
  

Future getImage(bool isCamera,ImageSource imageSource) async {
  File image;
  if (isCamera) {
     final PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    
    image = File(pickedFile.path);
  } else {
    final PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    
    image = File(pickedFile.path);
  }
  
  setState(() {
    _imageFile = image;
  });
}

Future upload() async {
 
  StorageUploadTask uploadTask = _reference.putFile(_imageFile);
  StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
  setState(() {
    _uploaded = true;
  });

}

Future download() async {
  String downloadAddress  = await _reference.getDownloadURL();
  setState(() {
    
    _downloadUrl = downloadAddress;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
       backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text('Firebase Storage'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200.0,
                child: RaisedButton.icon(
                  onPressed: () {
                   
                    getImage(true, ImageSource.camera);
                  },
                  label: Text('Camera',),
                  icon: Icon(Icons.camera),
                  ),
              ),


                Container(
                  width: 200.0,
                  child: RaisedButton.icon(
                  onPressed: () {

                    
                    getImage(false, ImageSource.gallery);
                  },
                  label: Text('Gallery',),
                  icon: Icon(Icons.image),
                  
                  ),
                   
                ),


               _imageFile == null ? Container(): Image.file(_imageFile,height: 500, width: 500,),
            
                
                 _imageFile == null ? Container() : Container(
                   width: 200.0,
                   child: RaisedButton.icon(
                     onPressed: () {
                       upload();
                     },
                     label: Text('Upload'),
                     icon: Icon(Icons.cloud_upload),
                     ),
                 ),
                
                   _uploaded == false ? Container() : Container(
                     width: 200.0,
                     child: RaisedButton.icon(
                       label: Text('Download'),
                       onPressed: () {
                         download();
                       },
                       icon: Icon(Icons.cloud_download),
                       ),
                   ),
                     _downloadUrl == null ? Container() :Image.network(_downloadUrl),
              
            ],
          ),
        ),
      ),
    );
  }
}
