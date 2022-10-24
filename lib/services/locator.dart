import 'package:cpssoft_test/controllers/user_controller.dart';
import 'package:cpssoft_test/services/user_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<UserService>(() => UserService());
  locator.registerLazySingleton<UserController>(() => UserController());
}
