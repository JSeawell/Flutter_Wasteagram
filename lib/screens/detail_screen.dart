import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key key, this.date, this.numItems, this.latitude, this.longitude}) : super(key: key);

  final DateTime date;
  final int numItems;
  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Text(
              '${DateFormat.MMMMEEEEd().format(date)}',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 10,),
            //Convert to reactive sized container
            Container(
              child: Center(child: Text("Photo"),),
              color: Colors.deepOrange, 
              height: 300,
              width: 300,
            ),
            SizedBox(height: 10,),
            Text(
              "Items: $numItems",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 10,),
            Text(
              "( $latitude ,  $longitude )",
              style: TextStyle(fontSize: 20),
            ),

        ],
      ),
    );
  }
}