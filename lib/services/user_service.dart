import 'dart:convert';

import 'package:cpssoft_test/models/city_model.dart';
import 'package:cpssoft_test/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<List<UserGet>> getListUser() async {
    Uri uri = Uri.parse(
        "https://627e360ab75a25d3f3b37d5a.mockapi.io/api/v1/accurate/user");
    http.Response response = await http.get(uri);
    List<UserGet> userGet = List<UserGet>.from(
        json.decode(response.body).map((x) => UserGet.fromJson(x)));
    return userGet;
  }

  Future<List<CityGet>> getListCity() async {
    Uri uri = Uri.parse(
        "https://627e360ab75a25d3f3b37d5a.mockapi.io/api/v1/accurate/city");
    http.Response response = await http.get(uri);
    List<CityGet> cityGet = List<CityGet>.from(
        json.decode(response.body).map((x) => CityGet.fromJson(x)));
    return cityGet;
  }

  Future<UserGet> postListUser(UserGet userGet) async {
    Uri uri = Uri.parse(
        "https://627e360ab75a25d3f3b37d5a.mockapi.io/api/v1/accurate/user");
    final body = json.encode({
      "name": userGet.name,
      "email": userGet.email,
      "address": userGet.address,
      "phone": userGet.phoneNumber,
      "city": userGet.city,
    });
    http.Response response = await http.post(uri, body: body);
    UserGet userPost = json.decode(response.body);
    return userPost;
  }
}
