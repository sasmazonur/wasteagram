import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//Stream the total number of waste food on the AppBar.
 Widget AppBarBuilder(BuildContext context){
    return AppBar(
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.6),
      title: StreamBuilder(
        stream: Firestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot) {
          int totalCount = 0;
          if (snapshot.hasData){
            for( var i = 0 ; i < snapshot.data.documents.length; i++ ) { 
              totalCount += snapshot.data.documents[i]['quantity'];
            }
            return Text("Wasteagram - $totalCount", style: TextStyle(fontWeight: FontWeight.bold),);
          }
          else{return Text("Wasteagram", style: TextStyle(fontWeight: FontWeight.bold));}
        },
      ),
    );
  }