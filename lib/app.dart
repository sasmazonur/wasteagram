import 'package:flutter/material.dart';
import 'package:wasteagram2/screens/HomePage.dart';
import 'package:wasteagram2/screens/AddItem.dart';
import 'package:wasteagram2/screens/ViewItem.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';


class MyApp extends StatefulWidget {
  // This widget is the root of the application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  //Routes for the application
  var routes = <String, WidgetBuilder>{
    MyHomePage.routeName: (BuildContext context) =>  MyHomePage(),
    AddItem.routeName : (BuildContext context) =>  AddItem(),
    ItemView.routeName : (BuildContext context) =>  ItemView(),
    };

  @override
  Widget build(BuildContext context) {
        return new MaterialApp(
          title: 'Wasteagram',
          initialRoute: '/',
          routes: routes,
          navigatorObservers: <NavigatorObserver>[observer],
    );
  }
}


