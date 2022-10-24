import 'package:cpssoft_test/bloc/user_bloc.dart';
import 'package:cpssoft_test/models/user_model.dart';
import 'package:cpssoft_test/views/city.dart';
import 'package:cpssoft_test/widgets/button_primary.dart';
import 'package:cpssoft_test/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class UserAdd extends StatefulWidget {
  const UserAdd({Key? key}) : super(key: key);

  @override
  State<UserAdd> createState() => _UserAddState();
}

class _UserAddState extends State<UserAdd> {
  final UserBloc userBloc = UserBloc();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController city = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Add"),
      ),
      body: BlocProvider(
        create: (_) => userBloc,
        child: BlocListener<UserBloc, UserState>(
          listener: (context, state) {},
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: key,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        InputTextField(
                          controller: name,
                          hintText: "Name",
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Name tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                        InputTextField(
                          controller: address,
                          hintText: "Address",
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Address tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                        InputTextField(
                          controller: email,
                          hintText: "Email",
                          keyboardType: TextInputType.emailAddress,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Email tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                        InputTextField(
                          controller: phone,
                          hintText: "Phone",
                          keyboardType: TextInputType.number,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Phone tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                        InputTextField(
                          controller: city,
                          hintText: "City",
                          readOnly: true,
                          onTap: () {
                            Get.bottomSheet(City(
                              onTap: (v) {
                                setState(() {
                                  city.text = v;
                                });
                              },
                            ));
                          },
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Phone tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  ButtonPrimary(
                    text: "Kirim",
                    textSize: 16,
                    onTap: () {
                      if (key.currentState!.validate()) {
                        // key.currentState!.reset();
                        context.read<UserBloc>().add(
                              PostListUser(
                                UserGet(
                                  id: "1",
                                  name: name.text,
                                  email: email.text,
                                  address: address.text,
                                  phoneNumber: phone.text,
                                  city: city.text,
                                ),
                              ),
                            );
                        Get.back(result: true);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
