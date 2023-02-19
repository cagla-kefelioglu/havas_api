// ignore_for_file: file_names, unused_import, duplicate_ignore, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:havasapi/home.dart';

// ignore_for_file: unused_import, avoid_print, unused_field, prefer_final_fields, curly_braces_in_flow_control_structures, use_key_in_widget_constructors

import 'constant/constant.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          Container(
            color: Constant.darkWhite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: height * 1,
                    width: width * 1,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/blog.jpg"),
                        fit: BoxFit.contain,
                        colorFilter: const ColorFilter.mode(
                          Color(0x88000000),
                          BlendMode.darken,
                        ),
                      )),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 50, bottom: 50),
                        child: SizedBox(
                          height: height * 1,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Everyday New",
                                          style: TextStyle(
                                              color: Constant.darkWhite
                                                  .withOpacity(0.7),
                                              fontSize: 20,
                                              fontFamily: 'PoppinsBold',
                                              fontWeight: FontWeight.w200),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Travel Blog",
                                          style: TextStyle(
                                              color: Constant.darkWhite,
                                              fontFamily: 'Gloock',
                                              fontSize: 35,
                                              letterSpacing: 4),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: width * 1,
                                  height: 60,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Grock.to(Home());
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Constant.orange,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(30),
                                        )),
                                    child: Text(
                                      "Devam Et",
                                      style: TextStyle(
                                        color: Constant.darkWhite,
                                        fontFamily: 'PoppinsBold',
                                        fontSize: 30,
                                        letterSpacing: 0.7,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ))
              ],
            ),
          )
        ],
      )),
    );
  }
}
