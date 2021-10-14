import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_task1/SearchScreen.dart';
import 'package:flutter/material.dart';

class CRUD_Operation extends StatefulWidget {
  @override
  _CRUD_OperationState createState() => _CRUD_OperationState();
}

class _CRUD_OperationState extends State<CRUD_Operation> {
  String name;
  String value;
  Stream<dynamic> info;

// Handy Dialog boxes
  Future<bool> addDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Add data',
              style: TextStyle(fontSize: 15.0),
            ),
            content: Container(
              height: 200.0,
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: "Enter name"),
                    onChanged: (value) {
                      this.name = value;
                    },
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Enter value"),
                    onChanged: (value) {
                      this.value = value;
                    },
                  )
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Add"),
                textColor: Colors.blueAccent,
                onPressed: () {
                  Navigator.of(context).pop();
                  Map<String, dynamic> data = {
                    "name": this.name,
                    "value": this.value
                  };
                  createData(data).then((result) {
                    dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              )
            ],
          );
        });
  }

  Future<bool> updateDialog(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Update data',
              style: TextStyle(fontSize: 15.0),
            ),
            content: Container(
              height: 200.0,
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: "Enter name"),
                    onChanged: (value) {
                      this.name = value;
                    },
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Enter value"),
                    onChanged: (value) {
                      this.value = value;
                    },
                  )
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Update"),
                textColor: Colors.blueAccent,
                onPressed: () {
                  Navigator.of(context).pop();
                  Map<String, dynamic> data = {
                    "name": this.name,
                    "value": this.value
                  };
                  updateData(selectedDoc, data).then((result) {
                    // dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              )
            ],
          );
        });
  }

  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Adding data",
              style: TextStyle(fontSize: 15.0),
            ),
            content: Text("Success"),
            actions: <Widget>[
              FlatButton(
                  child: Text("OK"),
                  textColor: Colors.lightBlueAccent,
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

// All CRUD operation functions

// 1) For adding new data
  Future<void> createData(data) async {
    FirebaseFirestore.instance.collection('data').add(data).catchError((e) {
      print(e);
    });
  }

// 2) For reading data from firestore
  readData() async {
    return await FirebaseFirestore.instance
        .collection('data')
        .orderBy('value', descending: true)
        .snapshots();
  }

// 3) For updating data
  updateData(selectedDoc, newvalues) {
    FirebaseFirestore.instance
        .collection('data')
        .doc(selectedDoc)
        .update(newvalues)
        .catchError((e) {
      print(e);
    });
  }

//  4) For deleting data
  deletingData(docId) {
    FirebaseFirestore.instance
        .collection('data')
        .doc(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }

// 5) Search data
  ascendingData() async {
    return FirebaseFirestore.instance
        .collection('data')
        .orderBy(value, descending: false);
  }

  @override
  void initState() {
    readData().then((results) {
      setState(() {
        info = results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Interface"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () async {
                addDialog(context);
              }),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Search())
                );
              }),
        ],
      ),
      backgroundColor: Colors.lightBlueAccent[100],
      body: _ShowData(),
    );
  }

  Widget _ShowData() {
    if (info != null) {
      return StreamBuilder(
        stream: info,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            padding: EdgeInsets.all(5.0),
            itemBuilder: (context, i) {
              return new ListTile(
                title: Text(
                  snapshot.data.docs[i].get("name"),
                  style: TextStyle(fontSize: 20.0),
                ),
                subtitle: Text(snapshot.data.docs[i].get("value")),
                onTap: () {
                  updateDialog(context, snapshot.data.docs[i].documentID);
                },
                onLongPress: () {
                  deletingData(snapshot.data.docs[i].documentID);
                },
              );
            },
          );
        },
      );
    } else {
      return Text("Loading Please wait...");
    }
  }
}
