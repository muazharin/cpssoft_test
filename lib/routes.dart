import 'package:cpssoft_test/views/user.dart';
import 'package:cpssoft_test/views/user_add.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: '/user',
    page: () => User(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/user_add',
    page: () => UserAdd(),
    transition: Transition.rightToLeft,
  ),
];
