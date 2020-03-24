import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart'; //StorageUploadTask
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';    
import 'dart:io';
import 'package:location/location.dart';
import 'package:wasteagram2/models/FoodWastePostDTO.dart';
import 'package:wasteagram2/models/Translations.dart';

//Waste food quantaty check function for testing 
class CountValidator {
  static String validate(String value){
    return value.isEmpty ? 'Number can\'t be empty': null;
  }
}

class AddItem extends StatefulWidget {
  static const routeName = '/addItem';

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  String url;
  File sampleImage;
  LocationData location;
  
  final formKey = new GlobalKey<FormState>();
  final post = FoodWastePostDTO();

  void initState() {
    super.initState();
    retrieveLocation();
  }

  //Get user's location
  void retrieveLocation() async {
    var locationService = Location();
    location = await locationService.getLocation();
    setState( () {});
  }

  //Get picture from Phone gallery
  Future getImage() async{
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImage = tempImage;
    });
  }

  //Get picture from Camera
  Future takeImage() async{
    var tempImage = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      sampleImage = tempImage;
    });
  }

  //Validate if form is valid and Save
  bool validateAndSave(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    return false;
  }

    @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: new AppBar(
        title: new Text('Add Food Waste'),
        backgroundColor: Color.fromRGBO(58, 66, 86, 0.8),
      ),
      body: new Center(
        
        child: sampleImage == null? (buildColumn()): enableUpload(),
        
      ),
    );
  }

  //Build Upload Image and Cancel buttons
  Column buildColumn() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Semantics(
              button: true,
              enabled: true,
              onTapHint: 'Choose Image from Gallery',
              child: RaisedButton(
                onPressed: getImage,
                child: Text('Choose Image'),
              ),
            ),
            Semantics(
              button: true,
              enabled: true,
              onTapHint: 'Take a Picture',
              child: RaisedButton(
                onPressed: takeImage,
                child: Text('Take Picture'),
              ),
            ),
            SizedBox(width: 10.0),
          ],
        ),
        Semantics(
          button: true,
          enabled: true,
          onTapHint: 'Cancel',
          child: RaisedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
        ),
      ],
    );
  }

  //
  Widget enableUpload(){
    return new Container(
      child: new Form(
        key: formKey,
        child: ListView(
          children: <Widget>
          [
            Image.file(sampleImage, height: 330.0, width: 660,),
            SizedBox(height: 15.0,),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly], // Only numbers can be entered
              decoration: new InputDecoration(
                labelText: 'Number of Items',
                hintText: Translations(
                  Localizations.localeOf(context)).quantifyFieldHint),
              validator: CountValidator.validate,
              onSaved: (value){
                return post.quantity = num.parse(value);
              },
            ),
            SizedBox(height: 15.0,),
            Semantics(
              button: true,
              enabled: true,
              onTapHint: 'Upload the Item',
              child: RaisedButton(
                elevation: 10.0,
                child: Text('Add a new Item'),
                textColor: Colors.white,
                color: Colors.pink,
                onPressed: saveToCloud,
              ),
            ),
            
          ],
        ),
      )
    );
  }

// If everything validated, Store the image and information on Firebase cloud
  void saveToCloud() async {
    if (validateAndSave()) {
      var timeKey = new DateTime.now();
      StorageReference postImageRef = FirebaseStorage.instance.ref().child("Post Images"); 
      StorageUploadTask uploadTask =  postImageRef.child(timeKey.toString() + ".jpg").putFile(sampleImage);
      
      //Get the image link
      var ImageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
      post.date = Timestamp.fromDate(timeKey); //Add the current time
      post.url = ImageUrl.toString(); //Add url address to post
      post.location = GeoPoint(location.latitude, location.longitude); //Add location to post
      post.addPostCloud(); //Add post to Cloud
      popScreen(context); //Pop to home screen
    }
  }

  void popScreen(context) {
    Navigator.of(context).pop();
  }
}
