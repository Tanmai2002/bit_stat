import 'dart:ffi';

import 'package:bit_stat/dartfiles/CrytoConvert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:hybrid_image/hybrid_image.dart';
import 'package:numeral/numeral.dart';
List cryptos=[];
List<String> favs=['Ethereum'];
double current_val=1.0;
bool isFav=false;
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    cryptos=ModalRoute.of(context)?.settings.arguments as List;
    cryptos[5].display();
    // print(cryptos);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.currency_bitcoin),
        title: Text('Bit Stat'),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              isFav=!isFav;
            });
          },
              icon: Icon(Icons.favorite),color: isFav?Colors.pink:Colors.white,)
        ],
      ),
      body: Column(
        children: [
          TextField(
            maxLines: 1,
            onChanged: (val){
              setState(() {
                current_val=double.parse(val);
              });
            },
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,

            decoration: InputDecoration(
              hintText: "Value in INR",
              border: OutlineInputBorder()
            )

          ),
          ListBuilder(),
        ],
      ),
    );
  }
}

class ListBuilder extends StatefulWidget {
  const ListBuilder({Key? key}) : super(key: key);

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  @override
  Widget build(BuildContext context) {
    List showingcryp=cryptos;
    if(isFav){
      showingcryp=cryptos.where((element) => favs.contains(element.name.toString())).toList();
    }
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: showingcryp.length,

          itemBuilder : (context, index) {
            return
              InkWell(
                onDoubleTap: (){
                  setState(() {
                    favs.add(showingcryp[index].name);
                  });

                },
                onTap: (){
                  Navigator.pushNamed(context, '/Favs',arguments: cryptos[index]);
                },

                child:Card(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Card(
                            margin: EdgeInsets.all(5.0),
                            child: FadeInImage(
                                image: NetworkImage(showingcryp[index].logo_url),
                                width: 50,
                                height: 50,
                                placeholder: AssetImage(
                                    "lib/assets/img.png"),
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  print(error=='Invalid image data');

                                  return SvgPicture.network(showingcryp[index].logo_url,width: 50,height: 50,);
                                }

                            ),
                          ),
                          if (favs.contains(showingcryp[index].name)) Icon(Icons.favorite,color: Colors.pinkAccent)
                        ],
                      ),
                      Column(
                        children: [
                          Text(showingcryp[index].name,style: TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis),
                          Text(Numeral(showingcryp[index].price_change).format(), style: TextStyle(color: showingcryp[index].price_change>0?Colors.green : Colors.red),)
                        ],
                      ),
                      Text(getValue(showingcryp[index].price),overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                ) ,
              );

          }),
    );
  }
}

String getValue(double d){
  d=current_val/d;
  return Numeral(d).format() ;
}

