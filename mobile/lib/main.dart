import 'package:mobile/AddProduct.dart';
import 'package:mobile/FormMain.dart';
import 'package:mobile/InforUser.dart';
import 'package:mobile/login.dart';
import 'package:mobile/productAdmin.dart';
import 'package:mobile/provider/admin_provider.dart';
import 'package:mobile/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:mobile/provider/user_provider.dart';
import 'package:mobile/register.dart';
import 'package:provider/provider.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProductProvider()),
      ChangeNotifierProvider(create: (_) => AdminProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: MaterialApp(home: option()),
  ));
}
