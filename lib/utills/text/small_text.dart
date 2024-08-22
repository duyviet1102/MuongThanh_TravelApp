import 'package:flutter/material.dart';
import 'package:htx_mh/utills/responsives/dimentions.dart';

import '../../resources/colors.dart';


class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;
  TextAlign textAlign;
  SmallText({Key? key,
    required this.text,
    this.size = 0,
    this.color = smallTextDefault,
    this.height = 1.2,
    this.textAlign = TextAlign.left
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        textAlign: textAlign,
        style : TextStyle(
          fontFamily: 'Roboto',
          color: color,
          height: height,
          fontWeight: FontWeight.w300,
          fontSize: size == 0?Dimentions.font13:size,
        )
    );
  }
}
