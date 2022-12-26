import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/model/admin.dart';
import 'package:http/http.dart' as http;

class AdminProvider extends ChangeNotifier {
  List<AdminModel> listad = [];
  void getList() async {
    //lay ds san pham tu FakeStoreAPI
    String urlAPI = 'http://localhost:3000/admin';
    var client = http.Client();
    var rs = await client.get(Uri.parse(urlAPI));
    var jsonString = rs.body;
    var jsonObject = jsonDecode(jsonString) as List;
    //print(jsonString);
    listad = jsonObject.map((e) {
      //print(e);
      return AdminModel(
        id: e['id'],
        un: e['un'],
        pass: e['pass'],
      );
    }).toList();

    notifyListeners();
  }

  bool ktdn(String un, String pass) {
    if (listad.isEmpty) {
      return false;
    } else {
      for (var e in listad) {
        if (e.un == un && e.pass == pass) return true;
      }
    }
    return false;
  }
}
