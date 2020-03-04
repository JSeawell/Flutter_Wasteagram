import 'package:flutter/material.dart';
import 'new_post_screen.dart';
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
                    ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: RaisedButton(
                      onPressed: () {
                        getImageFromCamera();
                      },
                      child: (
                        Text(
                          "Take Photo", 
                          style: TextStyle(
                            color: Colors.white, 
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      ), 
                      color: Colors.deepOrange,
                    ),
                  ),
                  SizedBox(width: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: RaisedButton(
                      onPressed: () {
                        getImageFromGallery();
                      },
                      child: (
                        Text(
                          "Get Image From Gallery", 
                          style: TextStyle(
                            color: Colors.white, 
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      ), 
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
      else{
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Image.file(image),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: RaisedButton(
                          onPressed: () {
                            getImageFromCamera();
                          },
                          child: (
                            Text(
                              "Take New Photo", 
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                              ),
                            )
                          ), 
                          color: Colors.deepOrange,
                        ),
                      ),
                      SizedBox(width: 5),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: RaisedButton(
                          onPressed: () {
                            getImageFromGallery();
                          },
                          child: (
                            Text(
                              "Get New Image", 
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                              ),
                            )
                          ), 
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NewPostScreen(image: image,)));
                    },
                    child: (
                      Text(
                        "Use This Image", 
                        style: TextStyle(
                          color: Colors.deepOrange, 
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                      )
                    ), 
                    color: Colors.white,
                  ),
                ),
            ],
          ),
        );
      }
  }
}