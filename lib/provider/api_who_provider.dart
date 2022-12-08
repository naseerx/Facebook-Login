import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../get_model.dart';
import '../model/country_model.dart';

class WhoApiProvider extends ChangeNotifier{

  WhoApiProvider(){
    streamController = StreamController();
    stream = streamController.stream;
    getAllEmployee();
    getAllCountry();
  }

  var countryList = <CountryModel>[];
  int incrementValue = 0;

  increaseValue() {
    incrementValue += 1;
    notifyListeners();
  }

  late StreamController streamController;
  late Stream stream;
  String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.e'
      'yJhdWQiOiIxIiwianRpIjoiYzIyYTY3M2Y2YzU2ZDJjNDVhNmJhM'
      'WNjM2M3MzE5ZDA1ZGRlNzIxZTU2ZWNkNjg3MDQyOWI5MWNjMDk1Y2U'
      '2N2U2NjAwZGY1ZDQ0NzJjOTUiLCJpYXQiOjE2NzAwNTM5MzQuODY3N'
      'jQzLCJuYmYiOjE2NzAwNTM5MzQuODY3NjQ1LCJleHAiOjE3MDE1ODk'
      '5MzQuODY1NzI0LCJzdWIiOiI3Iiwic2NvcGVzIjpbXX0.UjZsAKGZ5J'
      'kJ8UN809BBtkFDrQzryj2MjRt3Eq8A7NEJOwbzjESYmNo4EE7R99kzWk'
      '8insSOR4QVZN8H3LMaJfBVDpPAeu6MJ-V5WIODOMARzMBUjT9CVgVowG_'
      'VyBijNTds6mUW8PijqD79vevGplT6dBlWhWln4MnJ2cp7EZA-sHdCrX9s'
      '_rCWDCWou5p_OQXOHtQtC5Bkmv_9O-xL2lr1n3sXeZhBIHDkFbh0NQsRYr'
      'UIE2-tmuJrxHac-cvGdKqvi8YsqZYXu-c0vrDUyIIckMimU_mxo1x5_d'
      '510NaKvwEi5CdsEfyhY4NpGzqf_cvHPUOi1UDj90r_y_NmRtuQ1zDCkko'
      'VBySNELa6X1KHLS0In2bPSfQioFMJdRILp1xOyk-hbdTg7JplHnmX5Yh'
      'VEABXJ5kUtJCSV1hM7mgAoK1flXUjfYfqAJ8Xi4HlK2uX29_5Mw_Qh4W'
      'b96FgAZV51Hv37YjJZ6hdoccC0rIlJRHjKr-5lrimGDZQdUlU7th8Lqd'
      'o0Zcj3ZatYmyZTs7cPR_HnhYYCLa4DSkyeRcFYoRkXT_0hKd6SoHKTx'
      '59QJDxiO9rwKbAlCT71z_ZWFvJUzaqdlQtQuGvVs3202hB6g-u3fc0jgh'
      'ohhEaIfyUzDvi9XngTkD_MkFcqswUzrND_j8rLCgkBgsCdNER8xc';
  getAllCountry() async {
    streamController.add('loading');
    var url = 'https://restcountries.com/v2/all';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      for (var myData in jsonData) {
        CountryModel countryModel = CountryModel.fromJSON(myData);
        countryList.add(countryModel);

      }
      notifyListeners();
    } else {
      return streamController.add('went wrong');
    }
  }
  getAllEmployee() async {
    streamController.add('loading');
    var api = "https://hqsupplys.com/public/api/employee";
    var response = await http.get(Uri.parse(api), headers: {
      'Accept': "application/json",
      'Content-Type': "application/json",
      'Authorization': "Bearer $token",
    });
    if (kDebugMode) {
      print(response.statusCode);
      print("Body: ${response.body}");
    }
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      GetWandersModel model = GetWandersModel.fromJson(jsonData);
      if (kDebugMode) {
        print(model);
      }
      streamController.add(model);
      notifyListeners();
    } else {
      print(response.statusCode);
    }
  }

}