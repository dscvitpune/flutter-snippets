import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_task/delete_date.dart';
import 'package:crud_task/read_data.dart';
import 'package:crud_task/update_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'create_data.dart';


void main() {
  runApp(const MyApp());
  Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(  
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const title = "CRUD";
  
  deleteData() async {
     CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');
     QuerySnapshot querySnapshot = await collectionReference.get();
     querySnapshot.docs[1].reference.delete();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text(title),
          ),          
          body: Column(
            children:  [
              Center(
                child: Container(
                  margin: const EdgeInsets.all(20.0),
                  child: const Text("FIRESTORE CRUD OPS", style: TextStyle(fontSize: 30.0),
                )),                  
              ),
              MaterialButton(
                child: const Text("CREATE DATA", style: TextStyle(fontSize: 15)),
                height: 50,
                minWidth: 200,
                color: Colors.grey,
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateData()))              
                }
                ),
                const SizedBox(height: 30,),
                MaterialButton(
                child: const Text("READ DATA", style: TextStyle(fontSize: 15)),
                height: 50,
                minWidth: 200,
                color: Colors.grey,
                onPressed: ()=>{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ReadData()))                              
                }
                ),
                const SizedBox(height: 30,),
                MaterialButton(
                child: const Text("UPDATE DATA", style: TextStyle(fontSize: 15)),
                height: 50,
                minWidth: 200,
                color: Colors.grey,
                onPressed: ()=>{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const UpdateData()))
                }
                ),
                const SizedBox(height: 30,),
                MaterialButton(
                child: const Text("DELETE DATA", style: TextStyle(fontSize: 15)),
                height: 50,
                minWidth: 200,
                color: Colors.grey,
                onPressed: ()=>{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const DeleteData()))
                }
                ),
            ],            
          ),
        ),      
    );
  }
}
