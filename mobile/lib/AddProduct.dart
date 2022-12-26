import 'package:flutter/material.dart';
import 'package:mobile/ProductModels.dart';
import 'package:mobile/login.dart';
import 'package:mobile/model/product_model.dart';
import 'package:mobile/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/provider/product_provider.dart';
import 'package:mobile/provider/user_provider.dart';
import 'dart:async';
import 'dart:convert';

import 'package:provider/provider.dart';

Future<ProductModel> createProduct(String title, num price, String description,
    String category, String image, num id) async {
  final response = await http.post(
    Uri.parse('http://localhost:3000/products'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'imageUrl': image,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return ProductModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create albums.');
  }
}

class ADDProducts extends StatefulWidget {
  ADDProducts({super.key});

  @override
  State<ADDProducts> createState() => _ADDProductsState();
}

class _ADDProductsState extends State<ADDProducts> {
  final _titleController = TextEditingController();

  final _priceController = TextEditingController();

  final _categoryController = TextEditingController();

  final String image =
      "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg";
  final String description =
      "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday";
  Future<ProductModel>? _futureProduct;

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    if (productProvider.list.length == 0) {
      productProvider.getList();
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
                "ADD Product",
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
                      controller: _titleController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
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
                      controller: _priceController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Price',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _categoryController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'category',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              ElevatedButton(
                //this button is pressed to add contact
                onPressed: () {
                  setState(() {
                    _futureProduct = createProduct(
                        _titleController.text,
                        int.parse(_priceController.text),
                        description,
                        _categoryController.text,
                        image,
                        productProvider.list.length + 1);
                  });

                  Navigator.pop(context);
                },
                child: Text('ADD Product'),
              ),
            ],
          )),
        ));
  }
}
