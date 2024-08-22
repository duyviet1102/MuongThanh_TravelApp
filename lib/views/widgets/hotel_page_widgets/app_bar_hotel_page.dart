
import 'package:flutter/material.dart';

import 'package:htx_mh/views/widgets/custom_widgets/button_widget.dart';
import 'package:htx_mh/views/widgets/hotel_page_widgets/bottom_sheet_room_guest.dart';
import 'package:provider/provider.dart';

import '../../../resources/app_assets.dart';
import '../../../resources/colors.dart';
import '../../../utills/responsives/dimentions.dart';
import '../../../utills/text/big_text.dart';
import '../../../utills/text/middle_text.dart';
import '../../../utills/text/small_text.dart';
import '../../../viewmodels/controllers/counter_controller.dart';

class AppBarHotelPage extends StatefulWidget {

  const AppBarHotelPage({Key? key,
  }) : super(key: key);

  @override
  State<AppBarHotelPage> createState() => _AppBarHotelPageState();
}

class _AppBarHotelPageState extends State<AppBarHotelPage> {


  @override
  Widget build(BuildContext context) {

    return  Container(
      padding: EdgeInsets.only(left: Dimentions.width10, right: Dimentions.width10, top: Dimentions.height10),
      width: Dimentions.width50*5,
      height: Dimentions.height30*6,
      decoration: BoxDecoration(
          color: wColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimentions.radius10), topRight: Radius.circular(Dimentions.radius10))
      ),
      child:
      Column(
        children: <Widget>[
          buildSearchBar(),
          buildDateContainer(),
          buildPeopleAndRoomContainer(context),
          buildSearchButton(),
        ],
      ),
    );
  }
  Widget buildSearchBar() {
    return TextFormField(
      style: TextStyle(fontSize: Dimentions.font13),
      decoration: InputDecoration(
        constraints: BoxConstraints(
            maxHeight: Dimentions.height35,
            maxWidth: double.infinity
        ),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(vertical: Dimentions.height10/2, horizontal: Dimentions.width10/2),
        prefixIcon: Icon(Icons.search, size: Dimentions.height15,),
        hintText: "Nhập tên homstay...",
        hintStyle: TextStyle(fontSize: Dimentions.font12, fontWeight: FontWeight.w300),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
              color: greyColor,
              width: 1.0
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      onChanged: (value){},
    );
  }

  Future _displayBottomSheet(BuildContext context,){
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return BottomSheetHotelPage();
        }
    );
  }

  Widget buildPeopleAndRoomContainer(BuildContext context,) {

    return InkWell(
      onTap: () {
        _displayBottomSheet(context);
      },
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  color: shadowColor,
                  width: 0.3,
                )
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                  height: Dimentions.height40,
                  child: Row(
                    children: [
                      Image.asset(AppAssets.icTwoPeople, height: Dimentions.font16,),
                      Padding(
                          padding: EdgeInsets.only(left: Dimentions.width10),
                          child: RichText(text: TextSpan(children: [
                            WidgetSpan(child: BigText(text:"1", size: Dimentions.font12,)),
                            WidgetSpan(child: SmallText(text: " phòng - ", size: Dimentions.font12, color: bColor,)),
                            WidgetSpan(child: BigText(text:"1", size: Dimentions.font12,)),
                            WidgetSpan(child: SmallText(text: " người ", size: Dimentions.font12,color: bColor)),
                          ]))
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDateContainer() {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
                color: shadowColor,
                width: 0.3,
              ),
              bottom: BorderSide(
                color: shadowColor,
                width: 0.3,
              )
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
                height: Dimentions.height50,
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(
                          color: shadowColor,
                          width: 0.3,
                        )
                    )
                ),
                child: Row(
                  children: [
                    Image.asset(AppAssets.icCalender, height: Dimentions.font16,),
                    Padding(
                      padding: EdgeInsets.only(left: Dimentions.width10),
                      child: MiddleText(text: "26", size: Dimentions.font25,),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BigText(text: "Thg" + " " + "3", size: Dimentions.font9, color: bColor,),
                        SmallText(text: "Thứ năm", size: Dimentions.font9, color: bColor,)
                      ],
                    )
                  ],
                )
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.only(left: Dimentions.width25),
                child: Row(
                  children: [
                    MiddleText(text: "05", size: Dimentions.font25,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: "Thg" + " " + "4", size: Dimentions.font9, color: bColor,),
                        SmallText(text: "Thứ năm", size: Dimentions.font9, color: bColor,)
                      ],
                    )
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearchButton() => ButtonWidget(
      text: BigText(text: "Tìm kiếm", color: wColor,size: Dimentions.font12,),
      color: mainColor,
      height: Dimentions.height30,
      width: Dimentions.width55*3.5,
      borderRadius: Dimentions.radius10/2,
      marginTop: Dimentions.height10,
      onPressed: () { },
  );
}
