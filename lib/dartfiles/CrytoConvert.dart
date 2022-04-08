import 'dart:convert';

import 'package:http/http.dart';

class CryptoConvert{
  static String api='4e59b25fd3cf80bbcd0828580dee7a0356955347';
  static String url='https://api.nomics.com/v1/currencies/ticker?key=$api&interval=1d&convert=INR&platform-currency=ETH&per-page=100&page=1';
static Future<List> getAllCryptoDetails() async{
  Response response=await get(Uri.parse(url));
  // print(response.body);
  List l=jsonDecode(response.body);
  print(l[0]);
  // print(l[0]['id']);
  List cryptos=[];
  for(Map m in l){
    cryptos.add(Crypto(m));
  }
  print(cryptos[0]);
  print(cryptos.length);

  return cryptos;
  // return m;
}
}
class Crypto{
  late String id,currency,symbol,name,logo_url;
  late bool isActive;
  late double price,high,price_change,price_change_pct;
  late DateTime date;

  Crypto(Map cryp){
    id=cryp['id'];
    currency=cryp['currency'];
    symbol =cryp['symbol'];
    name=cryp['name'];
    logo_url=cryp['logo_url'];
    isActive=cryp['status']=='active';
    price=double.parse(cryp['price']);
    high=double.parse(cryp['high']);
    date=DateTime.parse(cryp['price_timestamp']);
    price_change=double.parse(cryp['1d']['price_change']);
    price_change_pct=double.parse(cryp['1d']['price_change_pct']);
  }
  void display(){
    print(name);
    print(price);
    print(date);
    print(logo_url);
  }
}