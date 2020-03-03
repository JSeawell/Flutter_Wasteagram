import 'package:flutter/material.dart';
import '../screens/detail_screen.dart';

class MainScreen extends StatelessWidget {
  
  final String title;
  
  MainScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
        centerTitle: true,
      ),
      body: DetailScreen(date: DateTime.now(), numItems: 7, latitude: 37.323, longitude: -122.031,),
    );
  }
}