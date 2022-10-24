import 'package:cpssoft_test/bloc/city_bloc.dart';
import 'package:cpssoft_test/bloc/user_bloc.dart';
import 'package:cpssoft_test/routes.dart';
import 'package:cpssoft_test/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserBloc userBloc = UserBloc();
  final CityBloc cityBloc = CityBloc();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => userBloc),
        BlocProvider(create: (_) => cityBloc),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CPSSoft',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/user',
        getPages: getPages,
      ),
    );
  }
}
