import 'package:cpssoft_test/bloc/user_bloc.dart';
import 'package:cpssoft_test/routes.dart';
import 'package:cpssoft_test/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserBloc userBloc = UserBloc();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CPSSoft',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/user',
      defaultTransition: Transition.fade,
      getPages: getPages,
    );
  }
}
