import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cpssoft_test/controllers/user_controller.dart';
import 'package:cpssoft_test/models/city_model.dart';
import 'package:cpssoft_test/models/user_model.dart';
import 'package:cpssoft_test/services/locator.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetListUser>((event, emit) async {
      try {
        emit(UserLoading());
        List<UserGet> userGet =
            await locator.get<UserController>().getListUser();
        Comparator<UserGet> comparator =
            (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
        userGet.sort(comparator);
        emit(UserLoaded(userGet));
      } on TimeoutException catch (_) {
        emit(UserError("Request Timeout"));
      } on SocketException catch (_) {
        emit(UserError("Unable to access server"));
      } catch (e) {
        emit(UserError("Something went wrong!"));
      }
    });

    on<PostListUser>((event, emit) async {
      try {
        UserGet userPost =
            await locator.get<UserController>().postListUser(event.userGet);
        final state = this.state as UserLoaded;
        List.from(state.userGet)..add(userPost);
      } on TimeoutException catch (_) {
        emit(UserError("Request Timeout"));
      } on SocketException catch (_) {
        emit(UserError("Unable to access server"));
      } catch (e) {
        emit(UserError("Something went wrong!"));
      }
    });
    on<SearchListUser>((event, emit) async {
      try {
        emit(UserLoading());
        List<UserGet> userGet =
            await locator.get<UserController>().getListUser();
        userGet = userGet.where((e) {
          if (event.type == "name") {
            return e.name!.toLowerCase().contains(event.keyword.toLowerCase());
          } else {
            return e.city!.toLowerCase().contains(event.keyword.toLowerCase());
          }
        }).toList();
        Comparator<UserGet> comparator =
            (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
        userGet.sort(comparator);
        emit(UserLoaded(userGet));
      } on TimeoutException catch (_) {
        emit(UserError("Request Timeout"));
      } on SocketException catch (_) {
        emit(UserError("Unable to access server"));
      } catch (e) {
        emit(UserError("Something went wrong!"));
      }
    });
  }
}
