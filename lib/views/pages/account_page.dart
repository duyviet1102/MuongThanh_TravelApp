import 'package:flutter/material.dart';
import 'package:htx_mh/utills/text/big_text.dart';
import 'package:htx_mh/utills/text/middle_text.dart';

import '../../resources/colors.dart';
import '../../utills/responsives/dimentions.dart';
import '../widgets/accountpage_widgets/account_page_body.dart';
import '../widgets/accountpage_widgets/account_page_title.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: accountPageBgrColor,
    body: CustomScrollView(
      slivers: [
        titleAccountPage(),
        bodyAccountPage()
      ],
    ),
  );

  Widget titleAccountPage() => SliverToBoxAdapter(
    child: Container(
      margin: EdgeInsets.only(top: Dimentions.height50, left: Dimentions.width20, right: Dimentions.width20),
      child: AccountTitle(),
    ),
  );

  Widget bodyAccountPage() => SliverToBoxAdapter(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: Dimentions.height30, left: Dimentions.width20, right: Dimentions.width20),
          padding: EdgeInsets.only(top: Dimentions.height10),
          decoration: BoxDecoration(
              color: wColor,
              borderRadius: BorderRadius.circular(Dimentions.radius10)
          ),
          child: AccountPageBody(),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: Dimentions.height20, horizontal: Dimentions.width20),
          padding: EdgeInsets.only(top: Dimentions.height20, left: Dimentions.width20),
          height: Dimentions.height40*4,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: wColor,
              borderRadius: BorderRadius.circular(Dimentions.radius10)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: "Đánh giá HTX Mường Hoa", size: Dimentions.font18,),
              SizedBox(
                width: Dimentions.width180,
                  child: MiddleText(text: "Giúp chúng tôi nâng cao chất lượng dịch vụ", maxLines: 2)),
              InkWell(
                onTap: (){print("Đánh giá");},
                child: Container(
                  margin: EdgeInsets.only(top: Dimentions.height15),
                  height: Dimentions.height35,
                  width: Dimentions.width110,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(Dimentions.radius10)
                  ),child: Align(
                          alignment: Alignment.center,
                    child: MiddleText(text: "Đánh giá", color: wColor, size: Dimentions.font18,)
                ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: Dimentions.height50*3,
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network("http://online.gov.vn/Content/EndUser/LogoCCDVSaleNoti/logoSaleNoti.png",
                  height:Dimentions.height55,
                  width: Dimentions.width50*3,
              ),
              Image.network(
                  height:Dimentions.height55,
                  width: Dimentions.width50*3,
                  "http://online.gov.vn/Content/EndUser/LogoCCDVSaleNoti/logoSaleNoti.png"),
            ],
          ),
        )
      ],
    ),
  );


}
