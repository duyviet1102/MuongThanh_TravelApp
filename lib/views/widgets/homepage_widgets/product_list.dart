import 'package:flutter/material.dart';
import 'package:htx_mh/utills/responsives/dimentions.dart';
import 'package:htx_mh/utills/text/middle_text.dart';

import '../../../models/product_model.dart';
import '../../../resources/colors.dart';
import '../../../utills/text/big_text.dart';
import '../../pages/product_page.dart';
import '../item_widgets/product_items.dart';

class ProductListHomePage extends StatelessWidget {
  final List<ProductModel> products;

  const ProductListHomePage({Key? key,
    required this.products
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimentions.height10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: Dimentions.width15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: "Các sản phẩm tại Mường Hoa", size: Dimentions.font24,),
                MiddleText(text: "Món ăn đặc sản và quà lưu niệm không thể bỏ qua", size: Dimentions.font15,)
              ],
            ),
          ),
          SizedBox(
            height: Dimentions.height50*5,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index){
                  EdgeInsets margin = EdgeInsets.zero;
                  if (index == 0) {
                    margin = EdgeInsets.only(left: Dimentions.width15);
                  }
                  return Container(
                    margin: margin,
                      child: ProductItemsList(product: products[index],)
                  );
                }),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: Dimentions.width130,
              height: Dimentions.height40,
              child: ElevatedButton(onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductPage()), // Chuyển hướng đến trang ProductPage
                );
              },
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
          ),
        ],
      ),
    );
  }
}
