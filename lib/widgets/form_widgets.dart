import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'buttons.dart';
import '../screens/photo_screen.dart';
import '../screens/detail_screen.dart';

Widget PostForm(BuildContext context, formKey, locationData, image){
  return Form( 
          key: formKey,
          child: SingleChildScrollView( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //convert to dynamically sized container
                ClickablePhoto(context, image),
                SizedBox(height: 10),
                ItemsInputBox(context),
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
      child: Center(child: Text("Select Photo"),),
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

Widget ItemsInputBox(BuildContext context){
  return TextFormField(
    keyboardType: TextInputType.number,
    autofocus: true,
    style: TextStyle(fontSize: 20),
    decoration: InputDecoration(
      hintText: 'How many items were wasted today?',
      labelText: '# of Items', 
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),),
    ),
    onSaved: (value) {
      //save values to database
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