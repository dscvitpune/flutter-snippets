import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ReadData extends StatefulWidget {
  const ReadData({ Key? key }) : super(key: key);

  @override
  _ReadDataState createState() => _ReadDataState();
}

class Data{
  @required late String name;
  @required late String email;
}

class _ReadDataState extends State<ReadData> {

  var mylist = [];
  final Stream<QuerySnapshot> data = FirebaseFirestore.instance.collection('data').snapshots();
  
  @override
  Widget build(BuildContext context) {          
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("READ DATA"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: data,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting)
          {
            return const Text("Loading");
          }
          final info = snapshot.requireData;
          return ListView.builder(
            itemCount: info.size,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(                    
                    children: [
                      Text(info.docs[index]['GR']),
                      Text(info.docs[index]['NAME']),
                      Text(info.docs[index]['EMAIL'])
                    ],
                  ),
                   ),
              );
          });
        }
        )
    );
  }
}