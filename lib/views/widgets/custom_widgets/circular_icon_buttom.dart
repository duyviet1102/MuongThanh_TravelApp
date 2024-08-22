import 'package:flutter/material.dart';
import 'package:htx_mh/resources/colors.dart';
import 'package:htx_mh/utills/responsives/dimentions.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final VoidCallback onPressed;

  const CircularIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.color = greyColor,
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        padding: EdgeInsets.all(Dimentions.height40 * 0.2),
        child: Icon(icon, size: size == 0? Dimentions.height25:size,),
      ),
    );
  }
}
