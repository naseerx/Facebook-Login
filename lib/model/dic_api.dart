// To parse this JSON data, do
//
//     final apiModel = apiModelFromJson(jsonString);

import 'dart:convert';

List<ApiModel> apiModelFromJson(String str) => List<ApiModel>.from(json.decode(str).map((x) => ApiModel.fromJson(x)));

String apiModelToJson(List<ApiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiModel {
  ApiModel({
   required this.word,
    required this.meanings,
  });

  String word;
  List<Meaning> meanings;

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
    word: json["word"],
    meanings: List<Meaning>.from(json["meanings"].map((x) => Meaning.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "word": word,
    "meanings": List<dynamic>.from(meanings.map((x) => x.toJson())),
  };
}


class Meaning {
  Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  String partOfSpeech;
  List<dynamic> definitions;
  factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
    partOfSpeech: json["partOfSpeech"],
    definitions: json['definitions'],
  );

  Map<String, dynamic> toJson() => {
    "partOfSpeech": partOfSpeech,
    "definitions": definitions == null ? null : List<dynamic>.from(definitions.map((x) => x.toJson())),
  };
}
