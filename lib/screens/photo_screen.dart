import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/buttons.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PhotoScreen extends StatefulWidget {
  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {

  File image;

  void getImageFromCamera() async {
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      
    });
  }

  void getImageFromGallery() async {
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if (image == null)
      return NoImageYet(context);
    else{
        return ImageSelected(context);
      }
  }

  Widget NoImageYet(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Wasteagram"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                
                TakePhotoButton(context, getImageFromCamera),
                SizedBox(width: 10),
                GetGalleryImageButton(context, getImageFromGallery)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget ImageSelected(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            SizedBox(
              child: Image.file(image),
              height: 300,
              width: 300,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  TakeNewPhotoButton(context, getImageFromCamera),
                  SizedBox(width: 5),
                  GetNewGalleryImageButton(context, getImageFromGallery)
                ],
              ),
            ),
            UseImageButton(context, image)
        ],
      ),
    );
  }
}