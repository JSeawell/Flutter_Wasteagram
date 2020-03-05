import 'package:flutter/material.dart';
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
  
  @override
  Widget build(BuildContext context) {
    //_totalItemsWasted = 0;
    return Scaffold(
      appBar: TopAppBarWithTotal(context),
      body: FirebasePostStream(context),
      bottomNavigationBar: BottomAppBarWithPostAdder(context)
    );
  }


  //WIDGETS:

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
                  child: Text("( ${newPost.latitude.toStringAsFixed(3)}) ,  ${newPost.longitude.toStringAsFixed(3)} )"),
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

  Widget TopAppBarWithTotal(BuildContext context){
    return AppBar(
      title: StreamBuilder(
        stream: Firestore.instance.collection('wasteagramPosts').snapshots(),
        builder: (context, snapshot) {
          int totalItemsWasted = 0;
          if (!snapshot.hasData){
            return Text("Wasteagram");
          }
          else{
            for( var i = 0 ; i < snapshot.data.documents.length; i++ ) { 
              totalItemsWasted += snapshot.data.documents[i]['numItemsWasted'];
            }
            return Text("Wasteagram - $totalItemsWasted");
          }
        },
      ),
      centerTitle: true,
    );
  }

  Widget FirebasePostStream(BuildContext context){
    return StreamBuilder(
      stream: Firestore.instance.collection('wasteagramPosts').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        }
        else{
          return ListView.builder(
            itemExtent: 150.0,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return _buildListItem(context, snapshot.data.documents[index]);
            }
          );
        }
      },
    );
  }

  Widget BottomAppBarWithPostAdder(BuildContext context){
    return BottomAppBar(
      color: Colors.deepOrange,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AddPostButton(context),
        ],
      ),
    );
  }
  
}