import 'package:flutter/material.dart';

import '../../../resources/colors.dart';
import '../../../utills/responsives/dimentions.dart';
import '../../../utills/text/big_text.dart';

class ButtonWidget extends StatelessWidget {
  final Widget text;
  final Color color;
  final double height;
  final double width;
  final double borderRadius;
  final double marginTop;
  final VoidCallback onPressed;
  const ButtonWidget({Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
    this.height = 0,
    this.width = 0,
    this.borderRadius = 0,
    this.marginTop = 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: marginTop),
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.withOpacity(1), // Màu đậm ở góc trên bên trái
              color.withOpacity(0.9),
              color.withOpacity(0.9), // Màu đậm ở góc trên bên trái
              color.withOpacity(1), // Màu nhạt ở góc dưới bên phải
            ],
            stops: const [0.1, 0.5, 0, 1.0], // Điểm dừng để điều chỉnh màu
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Align(
            alignment: Alignment.center,
            child: text
        ),
      ),
    );
  }
}
