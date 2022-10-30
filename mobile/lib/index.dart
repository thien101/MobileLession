import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class review extends StatelessWidget {
  const review({super.key});
  final String src =
      "https://images.unsplash.com/photo-1662422183036-c2ccb601227b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4N3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(children: [
          Image.network(src),
          Text("Osechinen Lake Campground",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 160),
                child: Text(
                  " Kandersteg, Switzerland",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 110),
                child: Icon(Icons.star, color: Colors.red),
              ),
              Text("41")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.phone, color: Colors.blue),
              Icon(Icons.location_on_sharp, color: Colors.blue),
              Icon(Icons.share, color: Colors.blue)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("CALL",
                  style: TextStyle(
                    color: Colors.blue,
                  )),
              Text("ROUTE",
                  style: TextStyle(
                    color: Colors.blue,
                  )),
              Text("SHARE",
                  style: TextStyle(
                    color: Colors.blue,
                  ))
            ],
          ),
          Text(
              "Sword Lake is one of the favorite places of tourists in Hanoi. Sword Lake is located in the city center. We heard many stories about Sword Lake and Turtle Tower. Sword Lake has two parts: the wide water surface and the Turtle tower. Turtle Tower has been here for a long time. It has a mossy antiquity on it. Looking at Hoan Kiem Lake, we will immediately think of Hanoi with thousands of years of civilization. Sword Lake has Ngoc Son Temple. To enter the temple, we will go through the red The Huc bridge mat. The space in the temple is dignified and peaceful. ",
              textAlign: TextAlign.center)
        ]),
      ),
    ));
  }
}
