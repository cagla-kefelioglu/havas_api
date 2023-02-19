// ignore_for_file: unused_import, file_names, use_key_in_widget_constructors, must_be_immutable, unused_local_variable, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, unused_element, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import '../constant/constant.dart';
import '../assets.dart';
import '../riverpord/infoRiverpord.dart';

class InfoCard extends StatelessWidget {
  //altBirimm info;
  Info info;
  InfoCard({this.info});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Column(
        children: [
          SizedBox(
            width: width * 1,
            child: GrockContainer(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        Assets.images.img_three,
                        width: 50,
                        height: 50,
                        //fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              info.title,
                              style: TextStyle(
                                  fontFamily: 'PoppinsBold',
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(info.body)
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [Text("${info.id}")],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _textStyle = TextStyle(
      color: Constant.dark,
      fontSize: 15,
      fontFamily: 'PoppinsBold',
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5);
}
