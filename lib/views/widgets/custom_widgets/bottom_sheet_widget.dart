import 'package:flutter/material.dart';
import 'package:htx_mh/resources/colors.dart';
import 'package:htx_mh/utills/responsives/dimentions.dart';

class BottomSheetWidget extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const BottomSheetWidget({
    Key? key,
    required this.child,
    this.backgroundColor = wColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimentions.radius10*2),
          topRight: Radius.circular(Dimentions.radius10*2),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: Dimentions.width40,
            height: Dimentions.height10/2,
            margin: EdgeInsets.symmetric(vertical: Dimentions.height10),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
