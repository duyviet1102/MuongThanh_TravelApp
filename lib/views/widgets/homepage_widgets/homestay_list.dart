import 'package:flutter/material.dart';
import 'package:htx_mh/models/hotel_model.dart';
import 'package:htx_mh/utills/responsives/dimentions.dart';
import 'package:htx_mh/utills/text/small_text.dart';
import 'package:htx_mh/views/pages/hotel_page.dart';

import '../../../resources/colors.dart';
import '../item_widgets/homestay_items.dart';

class HomeStayList extends StatelessWidget {
  final List<HotelModel> allHotels;
  HomeStayList({Key? key, required this.allHotels}) : super(key: key);

  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.yellowAccent,
    Colors.green,
  ];

  final List<Color> img = [
    Colors.yellowAccent,
    Colors.green,
    Colors.black,
    Colors.blueGrey,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimentions.height20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: Dimentions.width50*2,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HotelPage()));
                },
                child: Row(
                  children: [
                    SmallText(text: "Xem thêm", size: Dimentions.font15 ,color: wColor,),
                    Icon(Icons.chevron_right, color: wColor, size: Dimentions.height20,)
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: Dimentions.height260,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: Dimentions.height20),
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: allHotels.length,
                itemBuilder: (context, index){
                  EdgeInsets margin = EdgeInsets.zero;
                  if (index == 0) {
                    margin = EdgeInsets.only(left: Dimentions.width15);
                  }
                  return Container(
                    margin: margin,
                      child: HomeStayItems(hotelModel: allHotels[index],)
                  );
            }),
          )
        ],
      ),
    );
  }
}
