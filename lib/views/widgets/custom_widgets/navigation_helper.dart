import 'package:flutter/material.dart';

class NavigationHelper {
  static Future<void> navigateWithSlideTransition(BuildContext context, Widget destination) {
    return Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => destination,
        transitionsBuilder: (context, animation1, animation2, child) {
          var begin = Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation1.drive(tween),
            child: child,
          );
        },
      ),
    );
  }
}
