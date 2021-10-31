import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteData extends StatefulWidget {
  const DeleteData({ Key? key }) : super(key: key);

  @override
  _DeleteDataState createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {

  TextEditingController grController = TextEditingController();

  deleteData(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection('data').doc(grController.text);
    documentReference.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DELTE DATA"),
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextFormField(
              controller: grController,
              decoration: const InputDecoration(
                hintText: "GR",
                border: OutlineInputBorder(),            
              ),
              style: const TextStyle(fontSize: 20),
            ),
            MaterialButton(
                child: const Text("DELETE", style: TextStyle(fontSize: 15,)),                
                onPressed: ()=>{
                  deleteData()                             
                },
                color: Colors.red,
                ),
          ]
          
          )
            )      
    );
  }
}