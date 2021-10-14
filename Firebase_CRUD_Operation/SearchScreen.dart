import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SearchScreen();
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Interface"),
      ),
      backgroundColor: Colors.lightBlueAccent[100],
      body:Container(
        height: 800.0,
        color: Colors.white,
      )
    );
  }
}
// Currently working on it
//  Search function will be updated soon!