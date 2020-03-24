import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_storage/firebase_storage.dart'; //StorageUploadTask
import 'package:wasteagram2/models/FloatingAction.dart';
import 'package:wasteagram2/widgets/AppBarBuilder.dart';
import 'package:wasteagram2/screens/ViewItem.dart';
import 'package:wasteagram2/models/FoodWastePost.dart';

//https://codelabs.flutter-io.cn/codelabs/flutter-firebase/index.html#10

class MyHomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
@override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBarBuilder(context),
     backgroundColor: Color.fromRGBO(58, 66, 86, 0.8),
     body: _buildBody(context),
     floatingActionButton: Semantics(
       child: FloatingAction(),
       button: true,
       enabled: true,
       onTapHint: 'Select an Image',
       ),
   );
 }

//get the reference to Cloud Firestore by calling Firestore.instance
// call Firestore.instance.collection('posts').snapshots() to return a stream of snapshots.
// It will order list in descending
 Widget _buildBody(BuildContext context) {
   return StreamBuilder<QuerySnapshot>(
     stream: Firestore.instance.collection('posts').orderBy('date', descending: true).snapshots(),
     builder: (context, snapshot) {
       if (!snapshot.hasData) return CircularProgressIndicator(); // first time will display circular progress indicator.
       else{
       return _buildList(context, snapshot.data.documents);
       }
     },
   );
 }

 //Built List with ListView
 Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
   
   return ListView(
     padding: const EdgeInsets.only(top: 10.0),
     children: snapshot.map((data) => _buildListItem(context, data)).toList(),
   );
 }

//Get the items for to display in ListTile
 Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
   final record = FoodWastePost.fromFirestore(data);   
   return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8.0),
     child: Container(
       decoration: BoxDecoration(
         color: Colors.white,
         border: Border.all(color: Colors.grey, width: 6),
         borderRadius: BorderRadius.circular(12.0),
       ),
       child: ListTile(
         onLongPress: (){
           var url_record = record.date;
           StorageReference postImageRef = FirebaseStorage.instance.ref().child("Post Images");
           Future<void> uploadTask = postImageRef.child('$url_record'+'.jpg').delete();
           Firestore.instance.collection('posts').document(data.documentID).delete();
         },  
         leading: Image.network(record.url,  height: 50,width: 70,fit: BoxFit.fitWidth), //Thumbnail
         title: Text(formatDate(record.date, [DD, ', ', MM, ' ', d]), style: TextStyle(fontSize: 20),),
         trailing: Text(record.quantity.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),),
         onTap: () {
            Navigator.pushNamed(
              context,
              ItemView.routeName,
              arguments: record
            );
          },
       ),
     ),
   );
 }
}