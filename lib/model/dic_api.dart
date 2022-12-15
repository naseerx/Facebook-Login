import 'dart:convert';

List<HelloModal> helloModalFromJson(String str) =>
    List<HelloModal>.from(json.decode(str).map((x) => HelloModal.fromJson(x)));

class HelloModal {
  HelloModal({
    required this.word,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });

  String word;
  List<Phonetic> phonetics;
  List<Meaning> meanings;
  License license;
  List<String> sourceUrls;

  factory HelloModal.fromJson(Map<String, dynamic> json) => HelloModal(
    word: json["word"],
    phonetics: List<Phonetic>.from(
        json["phonetics"].map((x) => Phonetic.fromJson(x))),
    meanings: List<Meaning>.from(
        json["meanings"].map((x) => Meaning.fromJson(x))),
    license: License.fromJson(json["license"]),
    sourceUrls: List<String>.from(json["sourceUrls"].map((x) => x)),
  );
}

class License {
  License({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory License.fromJson(Map<String, dynamic> json) => License(
    name: json["name"],
    url: json["url"],
  );
}

class Meaning {
  Meaning({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });

  String partOfSpeech;
  List<Definition> definitions;
  List<String> synonyms;
  List<String> antonyms;

  factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
    partOfSpeech: json["partOfSpeech"],
    definitions: List<Definition>.from(
        json["definitions"].map((x) => Definition.fromJson(x))),
    synonyms: List<String>.from(json["synonyms"].map((x) => x)),
    antonyms: List<String>.from(json["antonyms"].map((x) => x)),
  );
}

class Definition {
  Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    required this.example,
  });

  String definition;
  List<dynamic> synonyms;
  List<dynamic> antonyms;
  String example;

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
    definition: json["definition"],
    synonyms: List<dynamic>.from(json["synonyms"].map((x) => x)),
    antonyms: List<dynamic>.from(json["antonyms"].map((x) => x)),
    example: json["example"],
  );
}

class Phonetic {
  Phonetic({
    required this.audio,
    required this.sourceUrl,
    required this.license,
    required this.text,
  });

  String audio;
  String sourceUrl;
  License license;
  String text;

  factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
    audio: json["audio"],
    sourceUrl: json["sourceUrl"],
    license: License.fromJson(json["license"]),
    text: json["text"],
  );
}
