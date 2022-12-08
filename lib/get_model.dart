// To parse this JSON data, do
//
//     final getWandersModel = getWandersModelFromJson(jsonString);

import 'dart:convert';

GetWandersModel getWandersModelFromJson(String str) =>
    GetWandersModel.fromJson(json.decode(str));

String getWandersModelToJson(GetWandersModel data) =>
    json.encode(data.toJson());

class GetWandersModel {
  GetWandersModel({
    required this.success,
  });

  List<Success> success;

  factory GetWandersModel.fromJson(Map<String, dynamic> json) =>
      GetWandersModel(
        success:
            List<Success>.from(json["success"].map((x) => Success.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x.toJson())),
      };
}

class Success {
  Success({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.address,
    required this.dateOfBirth,
    required this.profileImage,
    required this.category,
    required this.designation,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String address;
  String dateOfBirth;
  String profileImage;
  String category;
  dynamic designation;

  factory Success.fromJson(Map<String, dynamic> json) => Success(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        dateOfBirth: json["date_of_birth"],
        profileImage: json["profile_image"],
        category: json["category"],
        designation: json["designation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "address": address,
        "date_of_birth": dateOfBirth,
        "profile_image": profileImage,
        "category": category,
        "designation": designation,
      };
}
