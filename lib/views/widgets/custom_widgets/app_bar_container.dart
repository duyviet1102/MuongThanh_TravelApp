
import 'package:flutter/material.dart';

import '../../../utills/responsives/dimentions.dart';

class AppBarContainerWidget extends StatelessWidget {
  final Widget child;
  const AppBarContainerWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Dimentions.height20),
              bottomRight: Radius.circular(Dimentions.height20),
              ),
            child: SizedBox(
              height: 180,
              child: AppBar(
                centerTitle: true,
                automaticallyImplyLeading: true,
                elevation: 0,
                toolbarHeight: 90,
                backgroundColor: Colors.deepPurpleAccent,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 160),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: child,
          )
        ],
      ),
    );
  }
}
