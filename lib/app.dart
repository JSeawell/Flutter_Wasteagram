import 'package:flutter/material.dart';
import 'screens/list_screen.dart';
import 'screens/new_post_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/photo_screen.dart';
import 'package:wasteagram/screens/new_post_screen.dart';

class WasteagramApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: ListScreen(),
      /*
      routes: {
          '/': (context) => ListScreen(),
          //'new_post': (context) => NewPostScreen(),
          //'photo': (context) => PhotoScreen(),
          //'detail': (context) => DetailScreen()
        },
        */
    );
  }
}