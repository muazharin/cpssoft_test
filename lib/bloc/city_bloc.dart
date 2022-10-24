import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cpssoft_test/controllers/user_controller.dart';
import 'package:cpssoft_test/models/city_model.dart';
import 'package:cpssoft_test/services/locator.dart';
import 'package:equatable/equatable.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() : super(CityInitial()) {
    on<GetListCity>((event, emit) async {
      try {
        print("masuk");
        emit(CityLoading());
        List<CityGet> cityGet =
            await locator.get<UserController>().getListCity();
        Comparator<CityGet> comparator =
            (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
        cityGet.sort(comparator);
        cityGet.forEach((element) {
          print(element.name);
        });
        emit(CityLoaded(cityGet));
      } on TimeoutException catch (_) {
        emit(CityError("Request Timeout"));
      } on SocketException catch (_) {
        emit(CityError("Unable to access server"));
      } catch (e) {
        emit(CityError("Something went wrong!"));
      }
    });
  }
}
