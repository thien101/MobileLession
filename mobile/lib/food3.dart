import 'dart:html';

import 'package:mobile/food.dart';
import 'package:mobile/food2.dart';
import 'package:flutter/material.dart';

class gridview extends StatefulWidget {
  gridview({super.key});

  @override
  State<gridview> createState() => _gridviewState();
}

class _gridviewState extends State<gridview> {
  List<String> listfodd = [
    'assets/images/food2.png',
    'assets/images/food3.png',
  ];

  final List<restaurant> listres = [
    new restaurant("Shusi Den", "assets/images/nh1.png", "gioi thieu"),
    new restaurant("Hatshuhana", "assets/images/nh2.png", "gioi thieu")
  ];

  bool showGrid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeaderIcon(context),
              const SizedBox(
                height: 20,
              ),
              buildContent(context),
              const SizedBox(
                height: 40,
              ),
              buildMessage(context),
              const SizedBox(
                height: 20,
              ),
              buildDescrip(context),
              const SizedBox(
                height: 20,
              ),
              buildPlaces(context),
              const SizedBox(
                height: 20,
              ),
              buildRestaurant(context),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildHeaderIcon(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ],
    );
  }

  buildContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Today's Special",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.green,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
                size: 30,
              ),
              Text(
                "Cart",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }

  buildMessage(BuildContext context) {
    return const Text.rich(TextSpan(
      text: "Find out what's cooking today",
      style: TextStyle(color: Color.fromARGB(255, 182, 177, 177)),
    ));
  }

  buildDescrip(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 190,
          height: 310,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Colors.blue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/food1.png"))),
                ),
              ),
              const Text("yoshisama shushi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  )),
              Row(
                children: const [
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 14,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 14,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 14,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 14,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 14,
                  ),
                ],
              ),
              const Text("Lorem ipsum is a dummy text used for printing",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  )),
            ],
          ),
        ),
        Column(
          children: [
            ...listfodd.map((e) {
              return Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.green,
                  image:
                      DecorationImage(image: AssetImage(e), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }).toList()
          ],
        )
      ],
    );
  }

  buildPlaces(BuildContext context) {
    return const Text.rich(TextSpan(
      text: "Places  ____________________________",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ));
  }

  buildRestaurant(BuildContext context) {
    return Column(
      children: [
        ...listres.map((e) {
          return Row(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(e.getImage()), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Column(
                children: [
                  Text(e.getName(),
                      style: TextStyle(
                        fontSize: 15,
                      )),
                ],
              ),
              Container(),
            ],
          );
        })
      ],
    );
  }
}
