import 'package:flutter/material.dart';
import '../widgets/form_widgets.dart';
import 'package:location/location.dart';
import 'dart:io';


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

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: PostForm(context, formKey, locationData, widget.image),
      );
  }
}