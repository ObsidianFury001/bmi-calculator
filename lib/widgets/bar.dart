import 'package:flutter/material.dart';
import 'package:bmi_calculator/app_constants.dart';
import 'dart:developer' as dev;
// ignore_for_file: prefer_const_constructors
// ignore_for_file: key_constructors
class Bar extends StatelessWidget {
  final double barWidth;
  final MainAxisAlignment barAlignment;

  const Bar({ required this.barWidth, required this.barAlignment});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: barAlignment,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: barAlignment == MainAxisAlignment.end?
              BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                  color: accent
              ):BoxDecoration(
                borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              color: accent
          ),
        )
      ],
    );
  }

  BoxDecoration barDecoration() {
    print("=====================\nChecking barAlignment == MainAxisAlignment.end: ${barAlignment == MainAxisAlignment.end}");
    if(barAlignment == MainAxisAlignment.end){
      BoxDecoration box = BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          )
      );
      print("In Start BoxDecoration: $box");
      return box;
    }

    print("=====================\nChecking barAlignment == MainAxisAlignment.start: ${barAlignment == MainAxisAlignment.start}");
    if(barAlignment == MainAxisAlignment.start){
      BoxDecoration box = BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
          color: accent
      );
      print("In End BoxDecoration:  $box");
      return box;
    }

    else {
      print("None...");
      return BoxDecoration();
    }
  }
}
