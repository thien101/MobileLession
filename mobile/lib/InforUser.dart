import 'package:flutter/material.dart';
import 'package:mobile/ProductModels.dart';
import 'package:mobile/login.dart';
import 'package:mobile/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/provider/user_provider.dart';
import 'dart:async';
import 'dart:convert';

import 'package:provider/provider.dart';

Future<UserModel> updateUser(String un, String pass, String name, String phone,
    String email, String id) async {
  final response = await http.patch(
    Uri.parse('http://localhost:3000/users/' + id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'un': un,
      'pass': pass,
      'name': name,
      'phone': phone,
      'email': email,
      'id': id,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return UserModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to update produst.');
  }
}

class InforUser extends StatefulWidget {
  final UserModel? userInfor;
  InforUser({super.key, this.userInfor});

  @override
  State<InforUser> createState() => _InforUserState(userInfor);
}

class _InforUserState extends State<InforUser> {
  final _nameController = TextEditingController();

  final _EmailController = TextEditingController();

  final _PhoneController = TextEditingController();
  final UserModel? userInfor;
  Future<UserModel>? _futureUser;

  _InforUserState(this.userInfor);

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    if (userProvider.listuser.length == 0) {
      userProvider.getList();
    }
    return Scaffold(
        backgroundColor: Colors.deepOrange[100],
        body: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // text chào
              Text(
                "Update",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 20,
              ),
              // textfield họ và tên
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Họ và tên',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // text field email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _EmailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // text field email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _PhoneController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Số Điện Thoại',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // textfield tên đăng nhập
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         color: Colors.grey[200],
              //         borderRadius: BorderRadius.circular(12)),
              //     child: Padding(
              //       padding: const EdgeInsets.only(left: 20.0),
              //       child: TextField(
              //         controller: _UnController,
              //         decoration: InputDecoration(
              //           border: InputBorder.none,
              //           hintText: 'Tên đăng nhập',
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // // textfield mật khẩu
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         color: Colors.grey[200],
              //         borderRadius: BorderRadius.circular(12)),
              //     child: Padding(
              //       padding: const EdgeInsets.only(left: 20.0),
              //       child: TextField(
              //         controller: _PassController,
              //         obscureText: true,
              //         decoration: InputDecoration(
              //           border: InputBorder.none,
              //           hintText: 'Mật khẩu',
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),

              ElevatedButton(
                //this button is pressed to add contact
                onPressed: () {
                  setState(() {
                    _futureUser = updateUser(
                      userInfor!.un.toString(),
                      userInfor!.pass.toString(),
                      _nameController.text,
                      _PhoneController.text,
                      _EmailController.text,
                      userInfor!.id.toString(),
                    );
                  });

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => (ProductModels(
                                user: userProvider.timkiem(
                                    userInfor!.un.toString(),
                                    userInfor!.pass.toString()),
                              )))));
                },
                child: Text('UpDate'),
              ),
              SizedBox(
                height: 10,
              ),
              // đăng nhập
            ],
          )),
        ));
  }
}
