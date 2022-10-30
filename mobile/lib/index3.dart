import 'package:flutter/material.dart';

// ignore: camel_case_types
class Grid_view extends StatefulWidget {
  const Grid_view({super.key});

  @override
  State<Grid_view> createState() => _gridviewState();
}

class _gridviewState extends State<Grid_view> {
  List<String> list = [
    'assets/images/Picture1.png',
    'assets/images/Picture2.png',
    'assets/images/Picture3.png',
    'assets/images/Picture4.png',
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
              buildTitle(context),
              const SizedBox(
                height: 20,
              ),
              buildWelcome(context),
              const SizedBox(
                height: 40,
              ),
              buildSearch(context),
              const SizedBox(
                height: 20,
              ),
              buildSavedPlace(context),
              const SizedBox(
                height: 20,
              ),
              showGrid ? buildGrid(context) : buildList(context),
            ],
          ),
        ),
      ),
    );
  }

  buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        IconButton(onPressed: () {}, icon: Icon(Icons.extension))
      ],
    );
  }

  buildWelcome(BuildContext context) {
    return const Text.rich(TextSpan(
        text: "Welcome",
        style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: " Charlie", style: TextStyle(fontWeight: FontWeight.normal))
        ]));
  }

  buildSearch(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  buildSavedPlace(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Saved Places",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        buildIconButton(context)
      ],
    );
  }

  buildGrid(BuildContext context) {
    return Expanded(
      child: GridView.count(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        crossAxisCount: 2,
        children: [
          ...list.map((e) {
            return Container(
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage(e), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20)),
            );
          }).toList()
        ],
      ),
    );
  }

  buildList(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ...list.map((e) {
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 300,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage(e), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20)),
            );
          }).toList()
        ],
      ),
    );
  }

  buildIconButton(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              showGrid = false;
            });
          },
          icon: Icon(Icons.list),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                showGrid = true;
              });
            },
            icon: Icon(Icons.grid_view))
      ],
    );
  }
}
