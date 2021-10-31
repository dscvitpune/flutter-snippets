import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateData extends StatefulWidget {
  const CreateData({ Key? key }) : super(key: key);

  @override
  _CreateDataState createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController grController = TextEditingController();

  createData(){     
    DocumentReference documentReference = FirebaseFirestore.instance.collection('data').doc(grController.text);
    Map<String, String> fields = {
      "GR": grController.text,
      "NAME": nameController.text,
      "EMAIL": emailController.text
    };
    documentReference.set(fields);    
  }

  String error = "";
  Future<bool> checkDoc() async {
    var collectionRef = FirebaseFirestore.instance.collection('data');
    var doc = await collectionRef.doc(grController.text).get();
    if(doc.exists)
    {
      setState(() {
        error = "GR Already Exist";
      });
    }
    else{
      setState(() {
        error = "";
      });
    }
    return doc.exists;    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CREATE DATA"),
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextFormField(
              controller: grController,
              onEditingComplete: checkDoc,
              decoration:  InputDecoration(
                errorText: error,
                hintText: "GR",
                border: const OutlineInputBorder(),            
              ),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
              TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(),            
              ),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
             TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(),            
              ),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                error.isEmpty ? MaterialButton(
                child: const Text("CREATE", style: TextStyle(fontSize: 15)),                
                onPressed: ()=>{
                  createData()
                },
                color: Colors.blue,
                ) : const Text(" "),               
                const SizedBox(width: 50,),
                MaterialButton(
                child: const Text("CLEAR", style: TextStyle(fontSize: 15,)),                
                onPressed: ()=>{
                  nameController.clear(),
                  emailController.clear(),
                  grController.clear()
                },
                color: Colors.red,
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}