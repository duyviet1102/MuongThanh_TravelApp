import 'package:flutter/material.dart';
import 'package:htx_mh/views/pages/page_login.dart';
import 'package:htx_mh/views/pages/page_signup.dart';
import '../../../resources/app_assets.dart';
import '../../../resources/colors.dart';
import '../../../utills/responsives/dimentions.dart';
import '../../../utills/text/small_text.dart';


class AccountPageBody extends StatelessWidget {
  final List<Widget> icons = [
    Image.asset(AppAssets.icMngInvoice, height: Dimentions.height30, width: Dimentions.width30,),
    Icon(Icons.info_outline, size: Dimentions.height25,),
    Icon(Icons.headset_mic_outlined, size: Dimentions.height25,),
    Icon(Icons.policy_outlined, size: Dimentions.height25,),
    Icon(Icons.mode_comment_outlined, size: Dimentions.height25,),
    Icon(Icons.logout, size: Dimentions.height25,),
  ];
  final List<Widget> texts = [
    SmallText(text: "Quản lý hóa đơn", color: bColor, size: Dimentions.font18,),
    SmallText(text: "Về HTX Mường Hoa", color: bColor, size: Dimentions.font18,),
    SmallText(text: "Liên hệ", color: bColor, size: Dimentions.font18,),
    SmallText(text: "Chính sách và bảo mật", color: bColor, size: Dimentions.font18,),
    SmallText(text: "Gửi phản hồi", color: bColor, size: Dimentions.font18,),
    SmallText(text: "Đăng xuất", color: bColor, size: Dimentions.font18,)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buildBody(icons, texts),
    );
  }
  List<Widget> buildBody(List<Widget> icons, List<Widget> texts) {
    final iconsAndTexts = List<Widget>.generate(
      texts.length,
          (index){
            bool isLastRow = index == texts.length - 1;
        return InkWell(
          onTap: (){
            switch (index) {
              case 0:
                print('Quản lý hóa đơn clicked!');
                break;
              case 1:
                print('Giới thiệu clicked!');
                break;
              case 2:
                print('Liên hệ clicked!');
                break;
                case 3:
                print('chính sách clicked!');
                break;
                case 4:
                print('Phản hồi clicked!');
                break;
                case 5:
                  print('Phản hồi clicked!');
                break;
              default:
                break;
            }
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: Dimentions.width15, vertical: Dimentions.height10),
            decoration: BoxDecoration(
              border: isLastRow ? null: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.5), // Màu sắc của đường viền
                  width: 1.0, // Độ dày của đường viền
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(right: Dimentions.width10, bottom: Dimentions.height10),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: Dimentions.width10),
                    child: icons[index],
                  ),
                  texts[index],
                ],
              ),
            ),
          ),
        );
          }
    );
    return iconsAndTexts;
  }
}
