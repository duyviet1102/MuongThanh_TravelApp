import 'package:flutter/material.dart';
import 'package:htx_mh/resources/app_assets.dart';
import 'package:htx_mh/utills/text/middle_text.dart';
import 'package:htx_mh/viewmodels/products_view_model.dart';

import '../../resources/colors.dart';
import '../../utills/responsives/dimentions.dart';
import '../../utills/text/big_text.dart';
import '../widgets/custom_widgets/custom_search.dart';
import '../widgets/item_widgets/news_item.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  EdgeInsets margin = EdgeInsets.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: Dimentions.height40*2,
        title: Padding(
          padding: EdgeInsets.only(top: Dimentions.height10),
          child: Column(
            children: [
              BigText(text: "Tin tức và Sự kiện", color: wColor,size: Dimentions.font25,),
            ],
          ),
        ),
        backgroundColor: mainColor,
        actions: [
          IconButton(
              onPressed: (){
                showSearch(
                    context: context,
                    delegate: CustomSearch(productViewModel: ProductViewModel()));
              },
              icon: Icon(Icons.search_rounded, size: Dimentions.height30, color: wColor,))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          buildTopNews(),
          buildListNews(),
        ],
      ),
    );
  }
  Widget buildTopNews() => SliverToBoxAdapter(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: Dimentions.width15, top: Dimentions.height10),
          child: BigText(text: "Tin tức nổi bật",),
        ),
        SizedBox(
          height: Dimentions.height50*7.8,
          width: double.infinity,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index){
                if (index == 0) {
                  margin = EdgeInsets.only(left: Dimentions.width15, top: Dimentions.height15, right: Dimentions.width10);
                }
                return  buildImage();
              }),
        ),
      ],
    ),
  );

  Widget buildListNews() => SliverToBoxAdapter(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: Dimentions.width15, top: Dimentions.height15),
          child: BigText(text: "Tin mới",),
        ),
        SizedBox(
          width: double.infinity,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index){
                if (index == 0) {
                  margin = EdgeInsets.only(left: Dimentions.width15, top: Dimentions.height15, right: Dimentions.width10);
                }
                return const NewsItem();
              }),
        ),
      ],
    ),
  );

  Widget buildImage() => Stack(
    children: [
      Container(
        margin: margin,
        width: Dimentions.width40*7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimentions.height15),
            image: const DecorationImage(
                image: AssetImage(AppAssets.imgNews,),
                fit: BoxFit.cover
            )
        ),
      ),
      Positioned(
        bottom: Dimentions.height20,
        left: Dimentions.width20,
        right: Dimentions.width20,
        child: Container(
          margin: margin,
          height: Dimentions.height40*4,
          decoration: BoxDecoration(
            color: wColor,
            borderRadius:BorderRadius.circular(Dimentions.height15),
          ),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: Dimentions.height10, left: Dimentions.width10, right: Dimentions.width10),
                  child: MiddleText(
                    text:
                    "1Khách sạn Villa chính thức khai chương"
                    " 2Khách sạn Villa chính thức khai chương",
                    maxLines: 5,)
              ),
            ],
          ),
          ),
        ),
      Positioned(
        bottom: Dimentions.height25,
        right: Dimentions.width40,
        child: MiddleText(text: "15. 3. 2024"),)
    ],
  );
}
