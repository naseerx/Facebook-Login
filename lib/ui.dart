import 'dart:convert';

import 'package:fb/provider/counter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JamalApi extends StatefulWidget {
  const JamalApi({Key? key}) : super(key: key);

  @override
  State<JamalApi> createState() => _JamalApiState();
}

class _JamalApiState extends State<JamalApi> {
  @override
  Widget build(BuildContext context) {
    return Consumer<JamalApiProvider>(
      builder: (context, country, child) => Scaffold(
          appBar: AppBar(),
          body: StreamBuilder(
              stream: country.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == 'loading') {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (kDebugMode) {
                      print(">>>>>>>>> Post comments");
                    }
                    ApiModel postModal = snapshot.data as ApiModel;
                    return Text(postModal.milliSeconds.toString());
                  }
                } else {
                  return const Text('no data');
                }
              })
          ),
    );
  }
}

ApiModel apiModelFromJson(String str) => ApiModel.fromJson(json.decode(str));

String apiModelToJson(ApiModel data) => json.encode(data.toJson());

class ApiModel {
  ApiModel({
    required this.year,
    required this.month,
    required this.day,
    required this.hour,
    required this.minute,
    required this.seconds,
    required this.milliSeconds,
    required this.dateTime,
    required this.date,
    required this.time,
    required this.timeZone,
    required this.dayOfWeek,
  });

  int year;
  int month;
  int day;
  int hour;
  int minute;
  int seconds;
  int milliSeconds;
  DateTime dateTime;
  String date;
  String time;
  String timeZone;
  String dayOfWeek;

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
        year: json["year"],
        month: json["month"],
        day: json["day"],
        hour: json["hour"],
        minute: json["minute"],
        seconds: json["seconds"],
        milliSeconds: json["milliSeconds"],
        dateTime: DateTime.parse(json["dateTime"]),
        date: json["date"],
        time: json["time"],
        timeZone: json["timeZone"],
        dayOfWeek: json["dayOfWeek"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "month": month,
        "day": day,
        "hour": hour,
        "minute": minute,
        "seconds": seconds,
        "milliSeconds": milliSeconds,
        "dateTime": dateTime.toIso8601String(),
        "date": date,
        "time": time,
        "timeZone": timeZone,
        "dayOfWeek": dayOfWeek,
      };
}
