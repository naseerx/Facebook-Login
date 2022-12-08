

class CountryModel
{

  String name;
  String? capital;
  String region;
  int population;
  double? area;
  List<dynamic>? borders;
  String flag;

  CountryModel({
  required this.name,
  this.capital,
  required this.region,
  required this.population,
  this.area,
  this.borders,
  required this.flag,
  });

  static CountryModel fromJSON(Map<String, dynamic> json) {
  return CountryModel(
  name: json['name'],
  capital: json['capital'],
  region: json['region'],
  population: json['population'],
  area: json['area'],
  borders: json['borders'],
  flag: json['flag'],

  );
  }

}
class Languages {
  String? iso6391;
  String? iso6392;
  String? name;
  String? nativeName;

  Languages({this.iso6391, this.iso6392, this.name, this.nativeName});

  Languages.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso639_1'];
    iso6392 = json['iso639_2'];
    name = json['name'];
    nativeName = json['nativeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso639_1'] = this.iso6391;
    data['iso639_2'] = this.iso6392;
    data['name'] = this.name;
    data['nativeName'] = this.nativeName;
    return data;
  }
}


