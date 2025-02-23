import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'buttons.dart';
import '../screens/photo_screen.dart';
import 'dart:io';

Widget PostForm(BuildContext context, formKey, Future<String> Function(File image) getImageURL, locationData, image){
  return Form( 
          key: formKey,
          child: SingleChildScrollView( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //convert to dynamically sized container
                Semantics(
                  child: ClickablePhoto(context, image),
                  onTapHint: "Click here to select image",
                ),
                SizedBox(height: 10),
                ItemsInputBox(context, image, getImageURL, locationData.latitude, locationData.longitude),
                SizedBox(height: 10),
                SaveEntryButton(context, formKey, locationData),
              ]
            ),
          ),
        );
}

Widget ClickablePhoto(BuildContext context, image){
  if (image == null){
    return InkWell(
    child: Container(
      child: Center(child: Text(
          "Click here to select image",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),),
      height: 300, width: 300, color: Colors.deepOrange,
    ),
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoScreen()));
    },
  );
  }
  else{
    return InkWell(
    child: SizedBox( 
        child: Image.file(image),
        height: 300, width: 300,
      ),
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoScreen()));
    },
  );
  }
  
}

Widget ItemsInputBox(BuildContext context, File image, Future<String> Function(File image) getImageURL, double lat, double long){
  return TextFormField(
    keyboardType: TextInputType.number,
    autofocus: true,
    style: TextStyle(fontSize: 20),
    decoration: InputDecoration(
      hintText: 'How many items were wasted today?',
      labelText: '# of Items', 
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),),
    ),
    onSaved: (value) async {
      //get image URL from cloud storage
      //save values in firestore database
      Firestore.instance.collection('wasteagramPosts').add({
        'date': DateTime.now(),
        'imageFilename':await getImageURL(image),
        'numItemsWasted': int.parse(value),
        'latitude': lat,
        'longitude': long,
      });
    },
    validator: (value) {
      if (value.isEmpty) {
        return 'Please enter a value';
      }
      else {
        return null;
      }
    },
  );
}