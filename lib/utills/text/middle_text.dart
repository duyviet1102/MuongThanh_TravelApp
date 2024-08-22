import 'package:flutter/material.dart';
import 'package:htx_mh/utills/responsives/dimentions.dart';

class MiddleText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;
  int? maxLines;
  TextAlign textAlign;
  TextOverflow overflow;

  MiddleText({Key? key,
    required this.text,
    this.size = 0,
    this.height = 0,
    this.color = const Color(0xFF332d2b),
    this.overflow = TextOverflow.ellipsis,
    this.maxLines,
    this.textAlign = TextAlign.left,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style : TextStyle(
          fontFamily: 'Roboto',
          fontSize: size == 0?Dimentions.font16:size,
          fontWeight: FontWeight.w400,
          color: color,
          height: height == 0?1.5:height
        )
    );
  }
}


