import 'package:flutter/material.dart';

class Post {

  DateTime date;
  String image_filename;
  int numItemsWasted;
  double latitude;
  double longitude;

  Post({this.date, this.image_filename, this.numItemsWasted, this.latitude, this.longitude});
}