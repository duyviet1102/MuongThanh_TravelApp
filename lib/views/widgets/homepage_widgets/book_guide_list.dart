import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htx_mh/resources/app_assets.dart';
import 'package:htx_mh/utills/responsives/dimentions.dart';

import '../../../resources/colors.dart';
import '../../../utills/text/big_text.dart';
import '../../../utills/text/middle_text.dart';


class BookGuideList extends StatelessWidget {
  const BookGuideList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: "Tour du lịch yêu thích", size: Dimentions.font24,),
        MiddleText(text: "Tour du lịch hot nhất được HTX Mường Hoa đề xuất", size: Dimentions.font15,),
        listImage(context),
      ],
    );
  }
  Widget listImage(context) => SizedBox(
    height: Dimentions.bookguide,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: EdgeInsets.only(top: Dimentions.height10),
          height: Dimentions.height50*3,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimentions.radius10),
            image: DecorationImage(
              image: AssetImage( AppAssets.img2,),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: Dimentions.height450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: Dimentions.height280,
                    width: Dimentions.width180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimentions.radius10),
                      image: DecorationImage(
                        image: AssetImage( AppAssets.img1,),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: Dimentions.height135,
                    width: Dimentions.width180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimentions.radius10),
                      image: DecorationImage(
                        image: AssetImage( AppAssets.img6,),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimentions.height450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: Dimentions.height135,
                    width: Dimentions.width180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimentions.radius10),
                      image: DecorationImage(
                          image: AssetImage( AppAssets.img3,),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  Container(
                    height: Dimentions.height135,
                    width: Dimentions.width180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimentions.radius10),
                      image: DecorationImage(
                        image: AssetImage( AppAssets.img4,),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: Dimentions.height135,
                    width: Dimentions.width180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimentions.radius10),
                      image: DecorationImage(
                        image: AssetImage( AppAssets.img5,),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          width: Dimentions.width130,
          height: Dimentions.height40,
          child: ElevatedButton(onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(wColor),
              elevation: MaterialStateProperty.all<double>(Dimentions.height10/2),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimentions.radius10), // Độ cong của viền
                ),
              ),
            ),
            child: BigText(text: "Xem tất cả", size: Dimentions.font15,),
          ),
        ),
      ],
    ),
  );
}
