// ignore_for_file: unused_import, prefer_const_constructors, file_names, non_constant_identifier_names, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:havasapi/riverpord/infoRiverpord.dart';
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
                            child: _List(),
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

  FutureBuilder _List() {
    return FutureBuilder(
      future: GetAllInfo(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            shrinkWrap: true,
            // padding: [20,10,20,10].paddingLTRB,
            separatorBuilder: (context, index) => SizedBox(
              height: 2,
            ),
            itemBuilder: (context, index) {
              return InfoCard(
                info: snapshot.data[index],
              );
            },
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data.length,
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
