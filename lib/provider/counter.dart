import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/country_model.dart';

class CounterClass extends ChangeNotifier {
  int incrementValue = 0;

  increaseValue() {
    incrementValue += 1;
    notifyListeners();
  }
}

class CounterClassApi extends ChangeNotifier {
  late StreamController streamController;
  var countryList = <CountryModel>[];
  late Stream stream;

  CounterClassApi(){
    streamController = StreamController();
    stream = streamController.stream;
    getAllCountry();
  }

  getAllCountry() async {
    streamController.add('loading');
    var url = 'https://restcountries.com/v2/all';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      for (var myData in jsonData) {
        CountryModel countryModel = CountryModel.fromJSON(myData);
        countryList.add(countryModel);
        streamController.add(countryList);

      }
      notifyListeners();
    } else {
      return streamController.add('went wrong');
    }
  }
}
