// import 'package:baitap/index.dart';
import 'package:mobile/ProductModels.dart';
import 'package:mobile/provider/product_provider.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:mobile/index2.dart';
import 'package:mobile/index3.dart';
import 'package:mobile/food3.dart';
import 'package:mobile/form.dart';
import 'package:mobile/formbt.dart';
//import 'package:baitap/productlist_page.dart';
import 'package:provider/provider.dart';
import 'package:mobile/ProductModels.dart';
import 'package:mobile/index3.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProductProvider()),
    ],
    child: MaterialApp(home: HomePage()),
  ));
}
