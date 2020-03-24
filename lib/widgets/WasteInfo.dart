
import 'package:flutter/material.dart';
import 'package:wasteagram2/models/FoodWastePost.dart';

//Display the Food Waste information on the screen
class WasteInfoBuild extends StatelessWidget {
  const WasteInfoBuild({
    Key key,
    @required this.singlePost,
  }) : super(key: key);

  final FoodWastePost singlePost;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(15.0),
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[Text('Item Count: ' + singlePost.quantity.toString(), style: TextStyle(fontSize: 25)),
          SizedBox(height: 10,),
          Text('Latitude:' + singlePost.latitude.toString(), style: TextStyle(fontSize: 20)),
          Text('Longitude: ' + singlePost.longitude.toString(), style: TextStyle(fontSize: 20)),],
        ),
      ),
               );
  }
}
