import 'package:flutter/material.dart';

//Class for Internationalization
class Translations{
  Locale locale;

  Translations(Locale locale) {
    this.locale = locale;
  }
  final labels = {
    'en':{
      'quantifyFieldHint': 'Number of Wasted Items'
    },
    'tr' :{
      'quantifyFieldHint': 'Israf Edilen Urun Sayisi'
    }
  };

  String get quantifyFieldHint =>
    labels[locale.languageCode]['quantifyFieldHint'];

}