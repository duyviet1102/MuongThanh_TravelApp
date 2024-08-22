import 'package:flutter/material.dart';
import 'package:htx_mh/resources/app_assets.dart';
import 'package:htx_mh/resources/colors.dart';
import 'package:htx_mh/utills/responsives/dimentions.dart';
import 'package:htx_mh/utills/text/big_text.dart';
import 'package:htx_mh/utills/text/middle_text.dart';

class NewsItem extends StatefulWidget {
  const NewsItem({Key? key}) : super(key: key);

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: Dimentions.height20, bottom: Dimentions.height10),
          padding: EdgeInsets.symmetric(horizontal: Dimentions.width15,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Dimentions.width35*4,
                height: Dimentions.height30*6,
                decoration: BoxDecoration(
                    color: wColor,
                    borderRadius: BorderRadius.circular(Dimentions.radius10)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimentions.radius10),
                  child: Image.asset(
                    AppAssets.img6,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: Dimentions.width10),
                width: Dimentions.width40*6,
                child: MiddleText(text: "Mùa hoa tại Thung Lũng Mường Hoa", maxLines: 10,),
              )
            ],
          ),
        ),
        Positioned(
            bottom: Dimentions.height10,
            right: Dimentions.width10,
            child: BigText(text: "15. 3. 2024", size: Dimentions.font14,)
        )
      ],
    );
  }
}
