import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {

  final Post post;
  Uint8List _image;

  DetailScreen({Key key, this.post}) : super(key: key);
  
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  void getImage() async {
    int MAX_SIZE = 7*1024*1024;
    StorageReference photoReference = FirebaseStorage.instance.ref();
    photoReference.child("${widget.post.image_filename}").getData(MAX_SIZE).then((data) {
      this.setState((){
        widget._image = data;
      }); 
    }).catchError((error){
      print("$error");
    });

  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

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
              '${DateFormat.MMMMEEEEd().format(widget.post.date)}',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 10,),
            //Convert to reactive sized container
            Container(
              child: Semantics(
                child: Center(
                  child: widget._image == null ? Text("Loading Image...") : Image.memory(widget._image, fit: BoxFit.cover,),
                ),
                image: true,
                label: "Wastagram Post Image",
              ),
              height: 300,
              width: 300,
            ),
            SizedBox(height: 10,),
            Text(
              'Items wasted: ${widget.post.numItemsWasted}',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 10,),
            Text(
              '( ${widget.post.latitude.toStringAsFixed(3)} ,  ${widget.post.longitude.toStringAsFixed(3)} )',
              style: TextStyle(fontSize: 20),
            ),

        ],
      ),
    );
  }
}