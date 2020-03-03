import 'package:flutter/material.dart';
import 'screens/list_screen.dart';
import 'screens/main_screen.dart';

class WasteagramApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MainScreen(title: 'Wasteagram'),
    );
  }
}