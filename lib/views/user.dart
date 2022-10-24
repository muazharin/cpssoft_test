import 'dart:async';

import 'package:cpssoft_test/bloc/user_bloc.dart';
import 'package:cpssoft_test/models/user_model.dart';
import 'package:cpssoft_test/views/city.dart';
import 'package:cpssoft_test/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  final UserBloc userBloc = UserBloc();

  Timer? debounce;
  @override
  void initState() {
    userBloc.add(GetListUser());

    super.initState();
  }

  listUser(BuildContext context, List<UserGet> userGet) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: userGet.length,
            itemBuilder: (context, index) {
              final user = userGet[index];
              return ListTile(
                title: Text(user.name!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.email!),
                    Text(user.address!),
                    Text(user.phoneNumber!),
                    Text(user.city!),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed("user_add")!.then((value) {
                if (value != null) {
                  if (value) {
                    userBloc.add(GetListUser());
                  }
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: BlocProvider(
            create: (_) => userBloc,
            child: BlocListener<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            Expanded(
                              child: InputTextField(
                                hintText: "Masukkan kata kunci",
                                onChanged: (v) {
                                  if (debounce?.isActive ?? false)
                                    debounce!.cancel();
                                  debounce =
                                      Timer(const Duration(seconds: 1), () {
                                    setState(() {
                                      userBloc.add(SearchListUser(v, "name"));
                                    });
                                  });
                                },
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.bottomSheet(City(
                                  onTap: (v) {
                                    userBloc.add(SearchListUser(v, "city"));
                                  },
                                ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Icon(Icons.sort),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        if (state is UserInitial) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is UserLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is UserLoaded) {
                          return listUser(context, state.userGet);
                        } else if (state is UserError) {
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
