import 'dart:async';
import 'dart:convert';

import 'package:fb/model/dic_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/country_model.dart';
import '../ui.dart';

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

  CounterClassApi() {
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

class DictionaryApiProvider extends ChangeNotifier {
  late StreamController streamController;
  late Stream stream;

  DictionaryApiProvider() {
    streamController = StreamController();
    stream = streamController.stream;
    getAllCountry();
  }

  getAllCountry() async {
    streamController.add('loading');
    var url = 'https://api.dictionaryapi.dev/api/v2/entries/en/media';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      for (var myData in jsonData) {
        HelloModal modal = HelloModal.fromJson(myData);

        streamController.add(modal);
      }
      notifyListeners();
    } else {
      return streamController.add('went wrong');
    }
  }
}

class JamalApiProvider extends ChangeNotifier {
  late StreamController streamController;
  late Stream stream;

  JamalApiProvider() {
    streamController = StreamController();
    stream = streamController.stream;
    getAllTime();
  }

  getAllTime() async {
    try {
      streamController.add('loading');
      String endPointUrl =
          'https://www.timeapi.io/api/Time/current/zone?timeZone=Europe/Amsterdam';
      var request = await http.get(
        Uri.parse(endPointUrl),
      );
      var jsonData = json.decode(request.body);
      if (kDebugMode) {
        print(jsonData);
      }
      if (request.statusCode == 200) {
        var jsonData = json.decode(request.body);
        if (kDebugMode) {
          print(jsonData);
        }
        ApiModel postsModel = ApiModel.fromJson(jsonData);
        if (kDebugMode) {
          print(postsModel);
        }
        streamController.add(postsModel);
      }
    } catch (e) {
      if (kDebugMode) {
        print(
            'Server Exception for post comment api is ================= ${e.toString()}');
      }
    }
  }
}
