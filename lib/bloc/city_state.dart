part of 'city_bloc.dart';

abstract class CityState extends Equatable {
  const CityState();

  @override
  List<Object> get props => [];
}

class CityInitial extends CityState {}

class CityLoading extends CityState {}

class CityLoaded extends CityState {
  final List<CityGet> cityGet;
  const CityLoaded(this.cityGet);
}

class CityError extends CityState {
  final String message;
  const CityError(this.message);
}
