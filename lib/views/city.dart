import 'package:cpssoft_test/bloc/city_bloc.dart';
import 'package:cpssoft_test/models/city_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class City extends StatefulWidget {
  const City({Key? key, required this.onTap}) : super(key: key);
  final void Function(String v)? onTap;
  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  final CityBloc cityBloc = CityBloc();

  listCity(BuildContext context, List<CityGet> cityGet) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cityGet.length,
            itemBuilder: (context, index) {
              final city = cityGet[index];
              return InkWell(
                onTap: () {
                  widget.onTap!(city.name!);
                  Get.back();
                },
                child: ListTile(
                  title: Text(city.name!),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    print("init");
    cityBloc.add(GetListCity());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (_) => cityBloc,
        child: BlocBuilder<CityBloc, CityState>(
          builder: (context, state) {
            if (state is CityInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CityLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CityLoaded) {
              return listCity(context, state.cityGet);
            } else if (state is CityError) {
              return Container(
                child: Center(
                  child: Text(state.message),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
