import 'package:flutter/material.dart';
import 'package:htx_mh/resources/app_assets.dart';
import 'package:htx_mh/utills/text/big_text.dart';
import 'package:htx_mh/utills/text/small_text.dart';

import '../../../resources/colors.dart';
import '../../../utills/responsives/dimentions.dart';


class AccountTitle extends StatelessWidget {
  final List<Widget> icons = [
    Image.asset(AppAssets.icHeartOutLine),
    Image.asset(AppAssets.icInvoice, height: Dimentions.height35, width: Dimentions.width35,),
    Icon(Icons.notifications_outlined, size: Dimentions.height35,)
  ];
  final List<Widget> texts = [
    SmallText(text: "Yêu thích", color: bColor, size: Dimentions.font16,),
    SmallText(text: "Đơn hàng", color: bColor, size: Dimentions.font16,),
    SmallText(text: "Thông báo", color: bColor, size: Dimentions.font16,)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: Dimentions.width15),
              height: Dimentions.height40*2,
              width: Dimentions.width40*2,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(Dimentions.radius10*4)
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: "Phạm Văn Lâm"),
                InkWell(
                  onTap: (){
                    print('Text clicked!');
                  },
                  child: Row(
                      children: [
                      SmallText(text: "Thông tin của tôi" ,),
                      Icon(Icons.chevron_right, color: smallTextDefault, size: Dimentions.height20,)
                      ],
                    ),
                )
              ],
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: Dimentions.height20),
          padding: EdgeInsets.symmetric(horizontal: Dimentions.height20),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: buildTitleAccount(icons, texts)
          ),
        )
      ],
    );
  }
  List<Widget> buildTitleAccount(List<Widget> icons, List<Widget> texts) {
    final iconsAndTexts = List<Widget>.generate(
      icons.length,
          (index) => InkWell(
            onTap: (){
              switch (index) {
                case 0:
                  print('Yêu thích clicked!');
                  break;
                case 1:
                  print('Đơn hàng clicked!');
                  break;
                case 2:
                  print('Thông báo clicked!');
                  break;
                default:
                  break;
              }
            },
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: Dimentions.height10/2,),
                  child: icons[index],
                ),
                texts[index],
        ],
      ),
          ),
    );
    return iconsAndTexts;
  }
}
