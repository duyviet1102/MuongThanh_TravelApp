import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:htx_mh/resources/app_assets.dart';
import 'package:htx_mh/utills/text/big_text.dart';
import 'package:htx_mh/utills/text/small_text.dart';

import '../../resources/colors.dart';
import '../../utills/responsives/dimentions.dart';
import '../widgets/navigations_menu.dart';

class GuideTourPage extends StatelessWidget {
  const GuideTourPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Dimentions.height50 * 4),
        child: AppBar(
          flexibleSpace: FlexibleSpaceBar(
              background: Stack(children: [
            Positioned(
                child: Image.asset(
              AppAssets.imgBannerGuide,
              fit: BoxFit.cover,
            )),
            Positioned(
                top: Dimentions.height40 * 2,
                right: Dimentions.width30,
                left: Dimentions.width30,
                child: SizedBox(
                  height: Dimentions.height30 * 2,
                  width: Dimentions.height50 * 4,
                  child: BigText(
                    text: "Khám phá thung lũng Mường Hoa Cùng HTX Mường Hoa",
                    color: wColor,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                )),
            Positioned(
                left: Dimentions.width50 * 3,
                right: Dimentions.width50 * 3,
                top: Dimentions.height50 * 3,
                child: Container(
                  height: Dimentions.height50,
                  // width: Dimentions.width30*3,
                  decoration: BoxDecoration(
                    color: bColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(Dimentions.radius10),
                  ),
                  child: Center(
                      child: SmallText(
                    text: "Dịch vụ của chúng tôi",
                    color: wColor,
                    textAlign: TextAlign.center,
                  )),
                ))
          ])),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const NavigationMenu()), // Chuyển hướng đến trang ProductPage
              );
            },
            icon: Icon(
              Icons.arrow_back,
              size: Dimentions.height30,
              color: wColor,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search_rounded,
                  size: Dimentions.height30,
                  color: wColor,
                ))
          ],
        ),
      ),
      body: Column(
        children: [
          buildTabBar(),
          Expanded(
              child: buildBody()
          )
        ],
      ),
    );
  }

  Widget buildTabBar() => Container(color: Colors.red, height: 50, width: double.infinity,);

  Widget buildBody() => ListView.builder(
    scrollDirection: Axis.vertical,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.green,
            height: 100,
            width: 100,
            margin: EdgeInsets.all(10),
          );
        },
      );

}
