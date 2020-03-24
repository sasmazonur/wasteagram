
import 'package:cloud_firestore/cloud_firestore.dart';
//Post Class
class FoodWastePost {
  int quantity;
  String url;
  double latitude;
  double longitude;
  DateTime date;


  FoodWastePost({this.date, this.url, this.quantity, this.latitude, this.longitude});

  factory FoodWastePost.fromFirestore(DocumentSnapshot document) {
    return FoodWastePost(
      date: document['date'].toDate(),
      url: document['url'],
      quantity: document['quantity'],
      // if location not defined return null
      latitude: (document['location'] == null) ? null : document['location'].latitude,
      longitude: (document['location'] == null) ? null : document['location'].longitude,
    );
  }

}