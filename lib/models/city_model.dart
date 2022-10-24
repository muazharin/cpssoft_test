// To parse this JSON data, do
//
//     final cityGet = cityGetFromJson(jsonString);

import 'dart:convert';

CityGet cityGetFromJson(String str) => CityGet.fromJson(json.decode(str));

String cityGetToJson(CityGet data) => json.encode(data.toJson());

class CityGet {
  CityGet({
    this.name,
    this.id,
    this.address,
    this.email,
    this.phoneNumber,
    this.city,
  });

  String? name;
  String? id;
  String? address;
  String? email;
  String? phoneNumber;
  String? city;

  factory CityGet.fromJson(Map<String, dynamic> json) => CityGet(
        name: json["name"],
        id: json["id"],
        address: json["address"] == null ? null : json["address"],
        email: json["email"] == null ? null : json["email"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        city: json["city"] == null ? null : json["city"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "address": address == null ? null : address,
        "email": email == null ? null : email,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "city": city == null ? null : city,
      };
}
