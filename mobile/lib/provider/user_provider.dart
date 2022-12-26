import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/model/user.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  List<UserModel> listuser = [];
  late UserModel _user;
  void getList() async {
    //lay ds san pham tu FakeStoreAPI
    String urlAPI = 'http://localhost:3000/users';
    var client = http.Client();
    var rs = await client.get(Uri.parse(urlAPI));
    var jsonString = rs.body;
    var jsonObject = jsonDecode(jsonString) as List;
    //print(jsonString);
    listuser = jsonObject.map((e) {
      //print(e);
      return UserModel(
        un: e['un'],
        pass: e['pass'],
        name: e['name'],
        phone: e['phone'],
        email: e['email'],
        id: e['id'],
      );
    }).toList();

    notifyListeners();
  }

  bool ktdn(String un, String pass) {
    getList();
    if (listuser.isEmpty) {
      return false;
    } else {
      for (var e in listuser) {
        if (e.un == un && e.pass == pass) return true;
      }
    }
    return false;
  }

  UserModel? timkiem(String un, String pass) {
    getList();
    for (var e in listuser) {
      if (e.un == un && e.pass == pass) return e;
    }
    return null;
  }
}
