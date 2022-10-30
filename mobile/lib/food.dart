import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class food extends StatelessWidget {
  const food({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading phần đầu appbar
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
            iconSize: 27,
            color: Colors.grey,
          ),
          //action cuối appbar
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                iconSize: 27,
                color: Colors.grey)
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today's Special",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        child: Column(
                          children: [
                            // thùng chứa cái nút xanh
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.green,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.green.shade600,
                                        spreadRadius: 0.5,
                                        blurRadius: 2,
                                        offset: Offset(0, 5))
                                  ]),
                              // nội dung bên trong nút xanh
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  Text(
                                    "Cart",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Find out what's cook today",
                    style: TextStyle(color: Colors.grey),
                  ),
                  // tạo khối chứa ảnh
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        Container(
                          width: 250,
                          height: 400,
                          padding: EdgeInsets.symmetric(
                              vertical: 40, horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Colors.blue,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blue.shade600,
                                    spreadRadius: 0.5,
                                    blurRadius: 2,
                                    offset: Offset(0, 5))
                              ]),
                          // chèn chữ vô container
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/food1.png"))),
                                  ),
                                ),
                                Text("yoshisama shushi",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    )),
                                // tạo sao
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                    Icon(Icons.star,
                                        color: Colors.white, size: 14),
                                    Icon(Icons.star,
                                        color: Colors.white, size: 14),
                                    Icon(Icons.star,
                                        color: Colors.white, size: 14),
                                    Icon(Icons.star,
                                        color: Colors.white, size: 14),
                                    Text("250 Ratings",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ))
                                  ],
                                ),
                                Text(
                                    "Lorem ipsum is a dummy text used for printing",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ))
                              ]),
                        ),
                        // tạo cột chứa 2 container nhỏ bên phải
                        SizedBox(
                          width: 10,
                        ),
                        Column(children: [
                          Container(
                            width: 150,
                            height: 195,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Colors.green,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.green.shade600,
                                      spreadRadius: 0.5,
                                      blurRadius: 2,
                                      offset: Offset(0, 5))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/food2.png"))),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Yoshimasa Sushi",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
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
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 195,
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    color: Colors.black,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: Offset(0, 5))
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/food3.png"))),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Prato Sushi",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
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
                                  ],
                                ),
                              ),
                            ],
                            // het
                          ),
                        ])
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Places",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            Text(
                                "    ______________________________________________________")
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(32.0, 0.0, 8.0, 0.0),
                          child: Row(
                            children: [
                              Image.asset("assets/images/nh1.png"),
                              Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0)),
                              Column(
                                children: [
                                  Text(
                                    "Shushi den",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                  Text(
                                      "Lorem ipsum is a dummy text used for printing",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12))
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.green,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.green.shade600,
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: Offset(0, 5))
                                    ]),
                                child: Text("Oder now"),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.fromLTRB(32.0, 0.0, 0.0, 0.0)),
                            Image.asset("assets/images/nh2.png"),
                            Padding(
                                padding:
                                    EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0)),
                            Column(
                              children: [
                                Text(
                                  "Hatsuhana Shushi",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    )
                                  ],
                                ),
                                Text(
                                  "Lorem ipsum is a dummy text used for printing",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.green,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.green.shade600,
                                        spreadRadius: 0.5,
                                        blurRadius: 2,
                                        offset: Offset(0, 5))
                                  ]),
                              child: Text("Oder now"),
                            ),
                          ],
                        )
                      ],
                      // lam tiep o day
                    ),
                  )
                ]),
          ),
        )));
  }
}
