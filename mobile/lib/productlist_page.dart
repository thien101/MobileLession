import 'package:mobile/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getList();
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          ...productProvider.list.map((e) {
            return Padding(
              padding:
                  const EdgeInsets.only(left: 4.0, right: 4, top: 4, bottom: 4),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Column(
                  children: [
                    Image.network(
                      e.image ?? '',
                      height: 105,
                      width: 110,
                    ),
                    Text(e.title ?? 'Title NULL'),
                    // ignore: prefer_interpolation_to_compose_strings
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${e.price}\$',
                          style: TextStyle(color: Colors.red),
                        ),
                        Text(e.category.toString()),
                      ],
                    )
                  ],
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
