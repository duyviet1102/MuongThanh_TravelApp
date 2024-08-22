import 'package:flutter/material.dart';
import 'package:htx_mh/utills/text/big_text.dart';

import '../../resources/colors.dart';
import '../../utills/responsives/dimentions.dart';

class BookHomeStayPage extends StatefulWidget {
  const BookHomeStayPage({Key? key}) : super(key: key);

  @override
  State<BookHomeStayPage> createState() => _TourPageState();
}

class _TourPageState extends State<BookHomeStayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          accountAppBar()
        ],
      ),
    );
  }
  Widget accountAppBar() => SliverAppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    pinned: false,
    backgroundColor: wColor,
    expandedHeight: Dimentions.expandedHeight,
    title: Container(
      height: 200,
      width:200,
      color: Colors.green,
      child: Center(child: BigText(text: "Trang HomeStay",)),
    ),
  );
}
