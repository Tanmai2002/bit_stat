import 'package:bit_stat/dartfiles/CrytoConvert.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void getCryptoData() async{
    print("Initiated");
    CryptoConvert.getAllCryptoDetails();
  }
  @override
  void initState() {
    super.initState();
    getCryptoData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
