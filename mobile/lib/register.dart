import 'package:flutter/material.dart';
import 'package:mobile/ProductModels.dart';
import 'package:mobile/login.dart';
import 'package:mobile/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/provider/user_provider.dart';
import 'dart:async';
import 'dart:convert';

import 'package:provider/provider.dart';

Future<UserModel> createUser(String un, String pass, String name, String phone,
    String email, String id) async {
  final response = await http.post(
    Uri.parse('http://localhost:3000/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'un': un,
      'pass': pass,
      'name': name,
      'phone': phone,
      'email': email,
      'id': id.toString(),
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return UserModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create albums.');
  }
}

class dangky extends StatefulWidget {
  dangky({super.key});

  @override
  State<dangky> createState() => _dangkyState();
}

class _dangkyState extends State<dangky> {
  final _nameController = TextEditingController();

  final _EmailController = TextEditingController();

  final _PhoneController = TextEditingController();

  final _UnController = TextEditingController();

  final _PassController = TextEditingController();

  Future<UserModel>? _futureUser;

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
              // text ch??o
              Text(
                "????ng k??",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 20,
              ),
              // textfield h??? v?? t??n
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
                        hintText: 'H??? v?? t??n',
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
                        hintText: 'S??? ??i???n Tho???i',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // textfield t??n ????ng nh???p
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _UnController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'T??n ????ng nh???p',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // textfield m???t kh???u
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _PassController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'M???t kh???u',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // text field nh???p l???i m???t kh???u
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
              //         decoration: InputDecoration(
              //           border: InputBorder.none,
              //           hintText: 'Nh???p l???i m???t kh???u',
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // register button
              ElevatedButton(
                //this button is pressed to add contact
                onPressed: () {
                  setState(() {
                    _futureUser = createUser(
                        _UnController.text,
                        _PassController.text,
                        _nameController.text,
                        _PhoneController.text,
                        _EmailController.text,
                        (userProvider.listuser.length + 1).toString());
                  });

                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => (dangnhap()))));
                },
                child: Text('????ng K??'),
              ),
              SizedBox(
                height: 10,
              ),
              // ????ng nh???p
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("B???n ???? c?? t??i kho???n ?",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => (dangnhap()))));
                      },
                      child: Text("????ng nh???p"))
                ],
              )
            ],
          )),
        ));
  }
}
