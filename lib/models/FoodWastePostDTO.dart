import 'package:cloud_firestore/cloud_firestore.dart';
// Data transfer object (DTO) for Post 
class FoodWastePostDTO {
  Timestamp date;
  String url;
  GeoPoint location;
  int quantity;

  FoodWastePostDTO({this.url, this.location, this.quantity, this.date});

  void addPostCloud() {
    Firestore.instance.collection('posts').add({
      'date': this.date,
      'url': this.url,
      'location': this.location,
      'quantity': this.quantity,
    });
  }
}