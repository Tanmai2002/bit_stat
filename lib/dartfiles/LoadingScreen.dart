import 'package:bit_stat/dartfiles/CrytoConvert.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List cryptos=[];
  void getCryptoData() async{
    print("Initiated");
    cryptos=await CryptoConvert.getAllCryptoDetails();
    Navigator.popAndPushNamed(context, '/Home',arguments: cryptos);

  }
  @override
  void initState() {
    super.initState();
    getCryptoData();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body :Center(
        child: LoadingAnimationWidget.twistingDots(
          leftDotColor: Colors.blue,
          rightDotColor: Colors.indigo,
          size: 200,
        ),
      ),
    );
  }
}
