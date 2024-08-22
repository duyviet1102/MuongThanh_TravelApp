import 'package:flutter/material.dart';
import 'package:htx_mh/data/products_data.dart';
import 'package:htx_mh/models/product_model.dart';
import 'package:htx_mh/resources/app_assets.dart';
import 'package:htx_mh/utills/responsives/dimentions.dart';
import 'package:htx_mh/utills/text/small_text.dart';
import 'package:htx_mh/views/pages/book_homestay_page.dart';
import 'package:htx_mh/views/pages/guide_tour_page.dart';
import 'package:htx_mh/views/pages/hotel_page.dart';

import '../../../resources/colors.dart';
import '../../pages/product_page.dart';

class FlexibleTitleHome extends StatefulWidget {
  const FlexibleTitleHome({super.key});

  @override
  State<FlexibleTitleHome> createState() => _FlexibleTitleHomeState();
}

class _FlexibleTitleHomeState extends State<FlexibleTitleHome> {

  int _currentIndex = 0;

  final List<Image> icons = [
    Image.asset(AppAssets.gifTour, height: Dimentions.height30, width: Dimentions.width30,),
    Image.asset(AppAssets.gifHouse, height: Dimentions.height30, width: Dimentions.width30,),
    Image.asset(AppAssets.imgShoppingBag, height: Dimentions.height30, width: Dimentions.width30,),
    Image.asset(AppAssets.imgGuide, height: Dimentions.height30, width: Dimentions.width30,),
  ];

  final List<Widget> texts = [
    SmallText(text: "Tour",size: Dimentions.font10, color: bColor,),
    SmallText(text: "Home stay", size: Dimentions.font10, color: bColor),
    SmallText(text: "Sản Phẩm", size: Dimentions.font10, color: bColor),
    SmallText(text: "Cẩm nang", size: Dimentions.font10, color: bColor),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimentions.height10),
      margin: EdgeInsets.only(bottom: Dimentions.height10),
      width: Dimentions.widthFlexibleTitle,
      height: Dimentions.height30*2,
      decoration: ShapeDecoration(
        color: wColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 0.30,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFF9E9E9E),
          ),
          borderRadius: BorderRadius.circular(Dimentions.radius10),
        ),
        shadows: const [
          BoxShadow(
            color: shadowColor,
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buildFlexibleTitle(context, icons, texts),
      ),
    );
  }

  List<Widget> buildFlexibleTitle(BuildContext context, List<Image> icons, List<Widget> texts) {
    final iconsAndTexts = List<Widget>.generate(
      icons.length,
          (index) => InkWell(
            onTap: (){
              switch (index) {
                case 0:
                  print("Trang tour");
                  break;
                case 1:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HotelPage()),); // Chuyển hướng đến trang ProductPage
                  break;
                case 2:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductPage()));
                  break;
                case 3:
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const GuideTourPage()));
                print("Trang guide");
                  break;
                default:
                  break;
              }
            },
            child: Column(
        children: [
              icons[index],
              texts[index],
        ],
      ),
          ),
    );
    return iconsAndTexts;
  }
}
