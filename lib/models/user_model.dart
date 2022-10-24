import 'dart:convert';

UserGet userGetFromJson(String str) => UserGet.fromJson(json.decode(str));

String userGetToJson(UserGet data) => json.encode(data.toJson());

class UserGet {
  UserGet({
    this.name,
    this.address,
    this.email,
    this.phoneNumber,
    this.city,
    this.id,
  });

  String? name;
  String? address;
  String? email;
  String? phoneNumber;
  String? city;
  String? id;

  factory UserGet.fromJson(Map<String, dynamic> json) => UserGet(
        name: json["name"],
        address: json["address"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        city: json["city"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "email": email,
        "phoneNumber": phoneNumber,
        "city": city,
        "id": id,
      };
}
