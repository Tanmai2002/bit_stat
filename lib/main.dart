import 'package:bit_stat/dartfiles/Favs.dart';
import 'package:bit_stat/dartfiles/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:bit_stat/dartfiles/Home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/Favs',
    routes: {
      '/': (context)=>Loading(),
      '/Home': (context) =>Home(),
      '/Favs': (context)=>Desc()
    },
  ));
}





