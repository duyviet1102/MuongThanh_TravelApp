
import 'package:flutter/material.dart';
import 'package:htx_mh/resources/colors.dart';
import 'package:htx_mh/utills/responsives/dimentions.dart';
import 'package:htx_mh/utills/text/big_text.dart';
import 'package:htx_mh/utills/text/middle_text.dart';
import 'package:htx_mh/views/widgets/custom_widgets/bottom_sheet_widget.dart';
import 'package:htx_mh/views/widgets/custom_widgets/button_widget.dart';
import 'package:htx_mh/views/widgets/custom_widgets/circular_icon_buttom.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/controllers/counter_controller.dart';


class BottomSheetHotelPage extends StatelessWidget {

  const BottomSheetHotelPage({Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BottomSheetWidget(
        child: SizedBox(
         height: Dimentions.height50*5,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: Dimentions.width20),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          color: shadowColor,
                          width: 0.3,
                    )
                )
            ),
                height: Dimentions.height40*2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                MiddleText(text: "Phòng",color: bColor, size: Dimentions.font18,),
                SizedBox(
                  width: Dimentions.width50*5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircularIconButton(
                        icon: Icons.remove,
                        onPressed: () {
                        },
                      ),
                      BigText(text: "1"),
                      CircularIconButton(
                        icon: Icons.add,
                        onPressed:() {
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: Dimentions.width20),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: shadowColor,
                      width: 0.3,
                    )
                )
            ),
            height: Dimentions.height40*2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MiddleText(text: "Người",color: bColor, size: Dimentions.font18,),
                SizedBox(
                  width: Dimentions.width50*5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircularIconButton(
                        icon: Icons.remove,
                        onPressed: () {
                        },
                      ),
                      BigText(text: "1"),
                      CircularIconButton(
                        icon: Icons.add,
                        onPressed: () {
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimentions.width15),
            height: Dimentions.height40*2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  text: BigText(text: "Hủy bỏ", color: bColor, size: Dimentions.font18,),
                  color: const Color(0xffe0e0e0ff),
                  height: Dimentions.height50,
                  width: Dimentions.width180,
                  borderRadius: Dimentions.radius10, onPressed: () {Navigator.of(context).pop();},
                ),
                ButtonWidget(
                  text: BigText(text: "Chọn", color: wColor, size: Dimentions.font18,),
                  color: mainColor,
                  height: Dimentions.height50,
                  width: Dimentions.width180,
                  borderRadius: Dimentions.radius10, onPressed: () {

                  Navigator.of(context).pop();
                },
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
