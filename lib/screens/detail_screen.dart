import 'package:flutter/material.dart';
import '../models/post.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatelessWidget {
  
  final Post post;

  DetailScreen({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wasteagram"),
        centerTitle: true,
      ),
      body: PostDetailCard(context)
    );
  }

  Widget PostDetailCard(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Text(
              '${DateFormat.MMMMEEEEd().format(post.date)}',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 10,),
            //Convert to reactive sized container
            Container(
              child: Center(child: Text("${post.image_filename}"),),
              color: Colors.deepOrange, 
              height: 300,
              width: 300,
            ),
            SizedBox(height: 10,),
            Text(
              'Items wasted: ${post.numItemsWasted}',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 10,),
            Text(
              '( ${post.latitude.toStringAsFixed(3)} ,  ${post.longitude.toStringAsFixed(3)} )',
              style: TextStyle(fontSize: 20),
            ),

        ],
      ),
    );
  }
}