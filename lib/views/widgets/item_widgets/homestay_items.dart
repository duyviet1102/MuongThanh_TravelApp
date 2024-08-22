import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:htx_mh/models/hotel_model.dart';
import 'package:htx_mh/utills/responsives/dimentions.dart';
import 'package:htx_mh/utills/text/middle_text.dart';
import 'package:htx_mh/views/pages/detail_hotel_page.dart';
import 'package:provider/provider.dart';

import '../../../resources/app_assets.dart';
import '../../../resources/colors.dart';

class HomeStayItems extends StatelessWidget {
  final HotelModel hotelModel;
  final double marginRight;
  final double widthContainer;
  const HomeStayItems({Key? key,
    required this.hotelModel,
    this.marginRight = 0,
    this.widthContainer = 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetailHotelPage(hotelModel: hotelModel)),);
      },
      child: Container(
        width: Dimentions.width170,
        margin: EdgeInsets.only(right: marginRight == 0? Dimentions.width15:marginRight, top: Dimentions.height10, bottom: Dimentions.height10,),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimentions.radius10),
            color: wColor,
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ]
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child:
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimentions.radius10), topRight: Radius.circular(Dimentions.radius10)),
                child: Container(
                  height: Dimentions.height50*3,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppAssets.imgHomeStay,),
                          fit: BoxFit.fill,
                      ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: Container(
                        decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: Dimentions.height10,
                        left: Dimentions.height10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Dimentions.width50*3,
                                child: MiddleText(text: hotelModel.hotelName, color: wColor, maxLines: 1,)
                            ),
                            SizedBox(height: Dimentions.height10/2,),
                            Row(
                                children: List.generate(5, (index) => SizedBox(
                                  height: Dimentions.height15,
                                  width: Dimentions.width15,
                                  child: Image.asset(AppAssets.icStars,),
                                  )
                                )
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Dimentions.height10/2, left: Dimentions.width10/2, right: Dimentions.width10, bottom: Dimentions.height10/2),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(child: Icon(Icons.location_on, color: iconsColors, size: Dimentions.font18,),),
                      SizedBox(
                        height: Dimentions.height45,
                          width:  widthContainer == 0? Dimentions.width45*3 : widthContainer,
                          child: MiddleText(text: hotelModel.address, maxLines: 2, size: Dimentions.font15, ))
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: Dimentions.height10/2),
                      width: MediaQuery.of(context).size.width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MiddleText(text: hotelModel.price, color: redColor,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   color: Colors.green,
            //   child:
            // )
          ],
        ),
      ),
    );
  }
}
