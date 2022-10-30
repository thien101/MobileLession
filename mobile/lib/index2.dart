import 'dart:html';
import 'dart:js';

import 'package:mobile/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> list = [
    'assets/images/anh1.jpg',
    'assets/images/anh2.jpg',
    'assets/images/anh1.jpg',
    'assets/images/anh3.jpg',
    'assets/images/dotoc2.jpg',
  ];

  final List<course> _listCourses = [
    new course(
        '2021-2022.2.TIN3142.003',
        '[2021-2022.2] - Thực tập viết niên luận',
        12,
        'assets/images/anh2.jpg'),
    new course('2021-2022.2.TIN3142.0034', '[2021-2022.2] - Công nghệ XML', 12,
        'assets/images/anh3.jpg'),
    new course('2021-2022.2.TIN3142.0034', '[2021-2022.2] - Java nâng cao', 12,
        'assets/images/anh1.jpg'),
    new course(
        '2021-2022.2.TIN3142.0034',
        '[2021-2022.2] - Lập trình hướng đối tượng',
        12,
        'assets/images/anh2.jpg'),
    new course('2021-2022.2.TIN3142.0034', '[2021-2022.2] - Lập trình c#', 12,
        'assets/images/anh3.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        buildRowSlider(context),
        //buildListImage(context),
      ],
    )));
  }

  Container buildListImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ..._listCourses.map((e) {
              return Container(
                margin: EdgeInsets.all(10),
                height: 260,
                width: MediaQuery.of(context).size.width,
                child: Container(
                    child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(children: [
                    Text(
                      e.getCourseName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          e.getCourseId,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 140),
                      child: Row(
                        children: [
                          Text(
                            e.getNumberStudent.toString() + " học viên",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                )),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(e.getImage), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular((12))),
              );
            })
          ],
        ),
      ),
    );
  }

  Container buildRowSlider(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...list.map((e) {
              return Container(
                margin: EdgeInsets.all(10),
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(e), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular((30))),
              );
            })
          ],
        ),
      ),
    );
  }
}
