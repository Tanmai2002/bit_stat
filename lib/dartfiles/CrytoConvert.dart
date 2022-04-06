import 'package:http/http.dart';

class CryptoConvert{
  static String api='4e59b25fd3cf80bbcd0828580dee7a0356955347';
  static String url='https://api.nomics.com/v1/currencies/ticker?key=$api&interval=1d&convert=EUR&platform-currency=ETH&per-page=100&page=1';
static void getAllCryptoDetails() async{
  Response response=await get(Uri.parse(url));
  print(response.body);
  // return m;
}
}