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
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewPostScreen()),
        );
      },
      tooltip: 'Add Post',
      child: Icon(Icons.add),
    ),
  );
}

Widget SaveEntryButton(BuildContext context, formKey, locationData){
  return SizedBox(
    width: 200,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: RaisedButton(
        onPressed: () async {
          if (formKey.currentState.validate()){
            formKey.currentState.save();
            //save journal entry fields to DB
            print("( ${locationData.latitude} ,  ${locationData.longitude} ) ");
            print("New Entry Posted!");
            //go to list screen
            Navigator.push(context, MaterialPageRoute(builder: (context) => ListScreen()));
          }
        },
        child: (
          Text(
            "Post Entry", 
            style: TextStyle(
              color: Colors.white, 
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          )
        ), 
        color: Colors.deepOrange,
      ),
    )
  );
}