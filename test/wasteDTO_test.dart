
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wasteagram2/screens/AddItem.dart';
import 'package:wasteagram2/models/FoodWastePostDTO.dart';



void main () {

  //Test for creating DTO Food Waste post
  test('Create Food Waste DTO',(){
  FoodWastePostDTO waste = FoodWastePostDTO(
    location: GeoPoint(100.0, 39.0),
    url: 'wasteagram_test.com',
    quantity: 10,  
    );
    
    expect(waste.location.longitude, 39.0);
    expect(waste.location.latitude, 100.0);
    expect(waste.quantity, 10);
    expect(waste.url, 'wasteagram_test.com');
  });

}