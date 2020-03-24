import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:wasteagram2/models/FoodWastePost.dart';

//Displays the Date in custom style
class DetailDate extends StatelessWidget {
  const DetailDate({
    Key key,
    @required this.singlePost,
  }) : super(key: key);

  final FoodWastePost singlePost;

  @override
  Widget build(BuildContext context) {
    return Text(formatDate(singlePost.date, [DD, ', ', MM, ' ', d]), style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),);
  }
}