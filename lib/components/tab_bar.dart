// ignore_for_file: unused_import, prefer_typing_uninitialized_variables, must_be_immutable, use_key_in_widget_constructors, camel_case_types, unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_interpolation_to_compose_strings, depend_on_referenced_packages, prefer_adjacent_string_concatenation, unnecessary_string_interpolations, await_only_futures

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../assets.dart';
import '../constant/constant.dart';

class Tab_bar extends StatelessWidget {
  //var year = now.day;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8, top: height * 0.06, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    Assets.icons.menuuSVG,
                    width: 33,
                    color: Constant.dark,
                  ),
                  onPressed: () {
                    //scaffoldKey.currentState?.openDrawer();
                    //Grock.to(DriwirComponents());
                    // Grock.to(SekreterDriwirComponents());
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ignore: prefer_final_fields
  TextStyle _textStyle = TextStyle(
      fontSize: 15,
      fontFamily: 'PoppinsBold',
      color: Constant.dark,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);
}
