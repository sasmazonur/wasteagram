import 'package:flutter/material.dart';
import 'package:wasteagram2/models/FoodWastePost.dart';
import 'package:wasteagram2/widgets/ViewDate.dart';
import 'package:wasteagram2/widgets/ImageBuilder.dart';
import 'package:wasteagram2/widgets/WasteInfo.dart';



class ItemView extends StatefulWidget {
  static const routeName = '/itemView';

  @override
  _ItemViewState createState() => new _ItemViewState();
}

class _ItemViewState extends State<ItemView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FoodWastePost singlePost = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Item'),
        backgroundColor: Color.fromRGBO(58, 66, 86, 0.8),
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: ListView(
        children: <Widget>[
          Container(
            child: 
            Column(
              children: <Widget>[
                DetailDate(singlePost: singlePost),
                ImageBuild(singlePost: singlePost),
                SizedBox(height: 15,),
                WasteInfoBuild(singlePost: singlePost),
              ],
            ),
            ),
        ],
      ),
      );
  }
    
  
  void popScreen(context) {
    Navigator.of(context).pop();
  }
}










