import 'package:flutter/material.dart';
import '../screens/new_post_screen.dart';
import '../screens/list_screen.dart';

Widget AddPostButton(BuildContext context){
  return Padding( 
    padding: EdgeInsets.all(5),
    child: FloatingActionButton(
      backgroundColor: Colors.white,
      splashColor: Colors.deepOrange,
      foregroundColor: Colors.deepOrange,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewPostScreen()),);
      },
      tooltip: 'Add Post',
      child: Semantics(
        child: Icon(Icons.add),
        button: true,
        onTapHint: "Add Post",
        ),
    ),
  );
}

Widget SaveEntryButton(BuildContext context, formKey, locationData){
  return SizedBox(
    width: 200,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: FloatingActionButton(
        onPressed: () async {
          if (formKey.currentState.validate()){
            formKey.currentState.save();
            //go to list screen
            Navigator.push(context, MaterialPageRoute(builder: (context) => ListScreen()));
          }
        },
        child: Semantics(
          child: Icon(Icons.cloud_upload),
          button: true,
          onTapHint: "Upload to cloud",
        ), 
      ),
    )
  );
}

Widget TakePhotoButton(BuildContext context, Function() func){
  return ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: RaisedButton(
      onPressed: () {
        func();
      },
      child: Semantics(
        child: Icon(Icons.camera_alt, color: Colors.white,),
        button: true,
        onTapHint: "Open Camera",
        ), 
      color: Colors.deepOrange,
    ),
  );
}

Widget TakeNewPhotoButton(BuildContext context, Function() func){
  return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: RaisedButton(
        onPressed: () {
          func();
        },
        child: Semantics(
          child: Icon(Icons.camera_alt, color: Colors.white,),
          button: true,
          onTapHint: "Open Camera",
        ),
        color: Colors.deepOrange,
    )
  );
}

Widget GetGalleryImageButton(BuildContext context, Function() func){
  return ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: RaisedButton(
      onPressed: () {
        func();
      },
      child: Semantics(
        child: Icon(Icons.image, color: Colors.white,),
        button: true,
        onTapHint: "Open Gallery",
      ),
      color: Colors.deepOrange, 
    ),
  );
}

Widget GetNewGalleryImageButton(BuildContext context, Function() func){
  return ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: RaisedButton(
      onPressed: () {
        func();
      },
      child: Semantics(
        child: Icon(Icons.image, color: Colors.white,),
        button: true,
        onTapHint: "Open Gallery",
      ),
      color: Colors.deepOrange,
    ),
  );
}

Widget UseImageButton(BuildContext context, image){
  return ClipRRect(
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
  );
}
