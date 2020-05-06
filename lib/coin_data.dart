import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String fiat;
  String crypto;
  String apiKey = 'FBD07E19-F27B-484F-85F1-6369632DAEFE';
  CoinData({this.fiat, this.crypto});

  Future getCoinData() async {
    http.Response conversionData = await http.get(
        'https://rest.coinapi.io/v1/exchangerate/$crypto/$fiat?apikey=$apiKey');
    if (conversionData.statusCode == 200) {
      var decodedData = jsonDecode(conversionData.body);
      var rate = decodedData['rate'];
      return rate;
    } else {
      print(conversionData.statusCode);
      throw 'There was a problem accessing the server!';
    }
  }
}
