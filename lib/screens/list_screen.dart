import 'package:flutter/material.dart';
import '../screens/new_post_screen.dart';
import '../screens/detail_screen.dart';
import '../widgets/buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/post.dart';
import 'package:intl/intl.dart';


class ListScreen extends StatefulWidget {
  ListScreen({Key key}) : super(key: key);

  static const routeName = '/';
  
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  
  int _totalItemsWasted = 0;

  
  Widget _buildListItem(BuildContext context, DocumentSnapshot document){
    final newPost = Post(date: document['date'].toDate(), image_filename: document['imageFilename'], numItemsWasted: document['numItemsWasted'], latitude: document['latitude'].toDouble(), longitude: document['longitude'].toDouble());
    return ListTile(
      title: Card( 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Center(child: Text("${newPost.image_filename}"),),
              width: 150,
              height: 150, 
              color: Colors.deepOrange,
            ),
            SizedBox(width: 10,),
            Column(
              children: [
                Expanded(
                  child: Text("${DateFormat.MMMMEEEEd().format(newPost.date)}"),
                ),
                Expanded(
                child: Text("Wasted Items: ${newPost.numItemsWasted}"),
                ),
                Expanded(
                  child: Text("( ${newPost.latitude} ,  ${newPost.longitude} )"),
                ),
              ]
            ),
          ],
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(post: newPost)));
      },
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wasteagram - $_totalItemsWasted"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('wasteagramPosts').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }
          else{
            return ListView.builder(
              itemExtent: 150.0,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                _buildListItem(context, snapshot.data.documents[index]),
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepOrange,
        child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AddPostButton(context),
        ],
      ),
      ),
    );
  }

  void updateTotal(int totalItemsWasted){
    setState(() {
      _totalItemsWasted = totalItemsWasted;
    });
  }
  
}