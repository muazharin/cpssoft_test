import 'package:cpssoft_test/models/city_model.dart';
import 'package:cpssoft_test/models/user_model.dart';
import 'package:cpssoft_test/services/locator.dart';
import 'package:cpssoft_test/services/user_service.dart';

class UserController {
  Future<List<UserGet>> getListUser() async {
    final userGet = await locator.get<UserService>().getListUser();
    return userGet;
  }

  Future<List<CityGet>> getListCity() async {
    final cityGet = await locator.get<UserService>().getListCity();
    return cityGet;
  }

  Future<UserGet> postListUser(UserGet userGet) async {
    final userPost = await locator.get<UserService>().postListUser(userGet);
    return userPost;
  }
}
