import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/form_widgets.dart';
import 'package:location/location.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;


class NewPostScreen extends StatelessWidget {

  File image;
  
  NewPostScreen({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wasteagram"),
        centerTitle: true,
      ),
      body: NewPostForm(image: image),
    );
  }
}

class NewPostForm extends StatefulWidget {
  
  File image;
  
  NewPostForm({this.image});
  
  @override
  _NewPostFormState createState() => _NewPostFormState();
}

class _NewPostFormState extends State<NewPostForm> {

  final formKey = GlobalKey<FormState>();
  LocationData locationData;
  File image;
  
  void initState(){
    super.initState();
    retrieveLocation();
  }

  void retrieveLocation() async {
    var locationService = Location();
    locationData = await locationService.getLocation();
    setState(() {
    
    });
  }

  Future<String> getImageURL(File image) async {
      StorageReference storageReference = 
        FirebaseStorage.instance.ref().child("${DateFormat('yyyy_MM_dd_H_m_s').format(DateTime.now())}_${Path.basename(image.path)}");
      StorageUploadTask uploadTask = storageReference.putFile(image);
      await uploadTask.onComplete;
      final fullURL = await storageReference.getDownloadURL();
      final RegExp regExp = RegExp('(202.*.jpg)') ;
      final url = regExp.stringMatch(fullURL);
      print(url);
      return url;
  }

  @override
  Widget build(BuildContext context) {
    if (locationData == null){
      return Center(child: CircularProgressIndicator());
    }
    else{
      return Padding(
          padding: EdgeInsets.all(10),
          child: PostForm(context, formKey, getImageURL, locationData, widget.image),
        );
    }
  }
}