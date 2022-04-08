import 'dart:convert';

import 'package:bit_stat/dartfiles/CrytoConvert.dart';
import 'package:bit_stat/dartfiles/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:numeral/numeral.dart';

class Desc extends StatefulWidget {

  @override
  State<Desc> createState() => _DescState();
}

class _DescState extends State<Desc> {
  double investing_val=0;
  @override
  Widget build(BuildContext context) {
    Crypto cryptos=ModalRoute.of(context)?.settings.arguments as Crypto;

    return Scaffold(
      appBar: AppBar(title: Text(cryptos.name),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            SizedBox(height: 25,),
            FadeInImage(

                image: NetworkImage(cryptos.logo_url),
                width: 150,
                height: 150,
                placeholder: AssetImage(
                    "lib/assets/img.png"),
                imageErrorBuilder:
                    (context, error, stackTrace) {
                  print(error=='Invalid image data');

                  return SvgPicture.network(cryptos.logo_url,width: 150,height: 150,);
                }

          ),
          SizedBox(width :500,height: 15,),
          Text(
            cryptos.name,
            style: TextStyle(fontSize: 25),),
          SizedBox(width :500,height: 15,),
          Text(
            cryptos.symbol,
            style: TextStyle(fontSize: 15),),
          SizedBox(width :500,height: 15,),
          Text(
            Numeral(cryptos.price).format()+ " INR",
            style: TextStyle(fontSize: 15),),

          SizedBox(width :500,height: 15,),
          /////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cryptos.price_change_pct.toString()+ " %",
                style: TextStyle(
                    fontSize: 15,
                color:cryptos.price_change>0?Colors.green:Colors.red),),
              SizedBox(width: 50,),
              Text(
                Numeral(cryptos.price_change).format()+ " INR",
                style: TextStyle(
                    fontSize: 15,
                    color:cryptos.price_change>0?Colors.green:Colors.red),),
            ],
          ),

          SizedBox(width :500,height: 15,),
          Slider(value: investing_val,min: 0,max: 500000, onChanged: (d){
              setState(() {
                investing_val=d;
              });

          }),
          SizedBox(width :500,height: 15,),
          Text(
            'Investing Value :'+Numeral(investing_val).format()+ " INR",
            style: TextStyle(fontSize: 15),),

          SizedBox(width :500,height: 15,),
          Text(
            'Shares :'+(investing_val/cryptos.price).toString(),
            style: TextStyle(fontSize: 15),),

          SizedBox(width :500,height: 15,),



        ],

      ),

    );
  }
}

