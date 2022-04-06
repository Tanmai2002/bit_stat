import 'package:bit_stat/dartfiles/Favs.dart';
import 'package:flutter/material.dart';
import 'package:bit_stat/dartfiles/Home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context)=>Home(),
      '/Favs': (context)=>Favs()
    },
  ));
}





