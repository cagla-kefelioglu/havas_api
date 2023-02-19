// ignore_for_file: unused_import, prefer_const_constructors, file_names, non_constant_identifier_names, use_key_in_widget_constructors, sized_box_for_whitespace, missing_required_param, prefer_const_declarations, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:havasapi/riverpord/infoRiverpord.dart';
import 'assets.dart';
import 'components/card.dart';
import 'components/tab_bar.dart';
import 'constant/constant.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Constant.darkWhite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 1,
                    width: width * 1,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Tab_bar(),
                          //LİstView.sperated kullanılacak asko :)
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Günlük Yazılar",
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Önerilenler",
                                      style: TextStyle(
                                          fontFamily: 'Bebas',
                                          fontSize: 30,
                                          letterSpacing: 3),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: _List(width, height),
                          ),
                        ]),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget buildImage(
          Info infoImg, int index, double width, double height, Info info) =>
      Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Constant.dark),
          borderRadius: BorderRadius.circular(15.0),
          color: Constant.popat,
        ),
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Column(children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15)),
              child: Image.asset(
                Assets.images.img_one,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * 0.5,
                  child: Text(
                    info.title,
                    style: TextStyle(
                        color: Constant.dark,
                        fontFamily: 'PoppinsBold',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Text(
                  "${info.userId}",
                  style: TextStyle(
                    color: Constant.dark.withOpacity(0.7),
                    fontFamily: 'PoppinsBold',
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width * 0.6,
              height: height * 0.15,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(info.body,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      );
  FutureBuilder _List(double width, double height) {
    return FutureBuilder(
      future: GetAllInfo(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return CarouselSlider.builder(
            options: CarouselOptions(height: height * 0.7),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index, realIndex) {
              Info infoImg = snapshot.data[index];
              Info info = snapshot.data[index];

              return buildImage(infoImg, index, width, height, info);
            },
          );
        } else {
          return Container(
            margin: EdgeInsets.all(10),
            color: Constant.dark,
            width: 50,
            height: 10,
          );
        }
      },
    );
  }
}
