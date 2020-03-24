
import 'package:flutter/material.dart';
import 'package:wasteagram2/screens/AddItem.dart';

class FloatingAction extends StatelessWidget {
  const FloatingAction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.only(bottom: 20.0),
       child: Align(
         alignment: Alignment.bottomCenter,
         child: FloatingActionButton(
             child: new Icon(Icons.add_a_photo),
             backgroundColor: new Color(0xFFE57373),
             onPressed: () => pushAddItem(context),
           )
         ) ,
     );
  }

  void pushAddItem(context) {
    Navigator.of(context).pushNamed(AddItem.routeName);
  }
}