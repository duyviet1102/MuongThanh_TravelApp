
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:htx_mh/data/hotel_data.dart';
import 'package:htx_mh/models/hotel_model.dart';
import 'package:htx_mh/utills/text/middle_text.dart';

import '../../resources/app_assets.dart';
import '../../resources/colors.dart';
import '../../utills/responsives/dimentions.dart';
import '../../utills/text/big_text.dart';
import '../../utills/text/small_text.dart';
import '../widgets/custom_widgets/expandable_text_widget.dart';

class DetailHotelPage extends StatefulWidget {
  final HotelModel hotelModel;
  const DetailHotelPage({Key? key, required this.hotelModel,}) : super(key: key);

  @override
  State<DetailHotelPage> createState() => _DetailHotelPageState();
}

class _DetailHotelPageState extends State<DetailHotelPage> {
  int activeIndex = 0;

  final ScrollController _controller = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _controller.offset;
    if (offset > kToolbarHeight + Dimentions.height40*2) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: _isScrolled? wColor: mainColor,
        title: AnimatedOpacity(
            duration: const Duration(milliseconds: 400),
            opacity: _isScrolled ? 1.0 : 0.0,
            child: BigText(text: widget.hotelModel.hotelName, size: Dimentions.font20 ,color: bColor,)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: _isScrolled ? bColor : wColor, size: Dimentions.height30,)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: Dimentions.width10),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(AppAssets.icHeartOutLine,
                height: Dimentions.height25,width: Dimentions.width25,
                color: _isScrolled ? bColor : wColor,),
            ),
          ),
        ],
      ),
      body: ListView(
        controller: _controller,
        children: [
          buildTitle(),
          buildBodyInformation(),
          buildIntroduce(),
          buildDetailImage()
        ],
      ),
      bottomNavigationBar: buildBottomBar(),
    );
  }
  Widget buildTitle() => SizedBox(
    height: Dimentions.height40*10,
    child: Stack(
      children: [
        Positioned(child: SizedBox(
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: Dimentions.height50*5,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) => setState(() => activeIndex = index),
            ),
            itemCount: hotelData.imageDetail.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              final image = hotelData.imageDetail[index];
              return buildImage(image, index);
            },
          ),
        ),),
        Positioned(
            top: Dimentions.height40*6,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(left: 20),
              height: Dimentions.height20*7,
              decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimentions.radius10), topRight: Radius.circular(Dimentions.radius10))
              ),
              child: Padding(
                padding: EdgeInsets.only(top: Dimentions.height10, bottom: Dimentions.height10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BigText(text: widget.hotelModel.hotelName, size: Dimentions.font12*2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on, size: Dimentions.height20,),
                        SmallText(text: widget.hotelModel.address, size: Dimentions.font16, color: bColor,),
                      ],
                    ),
                    Row(
                      children: List.generate(5, (index) => SizedBox(
                        height: Dimentions.height15,
                        width: Dimentions.width15,
                        child: Image.asset(AppAssets.icStars,),
                      ),
                      ),
                    ),
                    SmallText(text: "Rất tốt" + " (1770 đánh giá)", size: Dimentions.font14, color: bColor,),
                  ],
                ),
              ),
            )
        )
      ],
    ),
  );

  Widget buildBodyInformation() => Container(
    padding: EdgeInsets.only(left: Dimentions.width20, top: Dimentions.height20),
    height: Dimentions.height280,
    color: containerColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: "Thông tin phòng", size: Dimentions.font20,),
        Container(
          padding: EdgeInsets.only(top: Dimentions.height10, bottom: Dimentions.height10),
          height: Dimentions.height30*7,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: Dimentions.height50,
                      margin: EdgeInsets.only(bottom: Dimentions.height10, right: Dimentions.width15 ),
                      child: MiddleText(text: "Loại phòng", size: Dimentions.font18,),
                  ),
                  MiddleText(text: "Diện tích", size: Dimentions.font18),
                  MiddleText(text: "Giường ngủ", size: Dimentions.font18),
                  MiddleText(text: "Sức chứa", size: Dimentions.font18),
                  MiddleText(text: "Giá phòng", size: Dimentions.font18),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: Dimentions.height10,),
                    height: Dimentions.height50,
                    width: Dimentions.height260,
                    child: MiddleText(text: "Phòng gia đình có view ruộng bậc thang nằm ", size: Dimentions.font18, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  ),
                  MiddleText(text: "25m²", size: Dimentions.font18),
                  MiddleText(text: "2 giường đôi lớn", size: Dimentions.font18),
                  MiddleText(text: "Tối đa 4 người", size: Dimentions.font18),
                  MiddleText(text: "340.000 VND/ phòng/ đêm", size: Dimentions.font18),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget buildIntroduce() => Container(
    margin: EdgeInsets.only(top: Dimentions.height15),
    padding: EdgeInsets.only(left: Dimentions.width20, top: Dimentions.height20),
    height: Dimentions.height280,
    color: containerColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: "Giới thiệu", size: Dimentions.font20,),
        SizedBox(height: Dimentions.height10,),
        SizedBox(
          height: 210,
          child: SingleChildScrollView(
            child: ExpandableTextWidget(text: widget.hotelModel.introduce),
          ),
        ),
      ],
    ),
  );

  Widget buildDetailImage() => Container(
    margin: EdgeInsets.only(top: Dimentions.height15, bottom: Dimentions.height20),
    padding: EdgeInsets.only(left: Dimentions.width20, top: Dimentions.height20, bottom: Dimentions.height20),
    height: Dimentions.height50*11,
    color: containerColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: "Ảnh check-in tại ${widget.hotelModel.hotelName}", size: Dimentions.font20, maxLines: 2,),
        SizedBox(height: Dimentions.height10,),
        Expanded(
          child: GridView.builder(
            itemCount: hotelData.imageDetail.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5
              ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(top: Dimentions.height10, right: Dimentions.width10, bottom: Dimentions.height10/2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimentions.radius10),
                      child: hotelData.imageDetail[index]
                  )
              );
            },
          ),
        )
      ],
    ),
  );

  Widget buildBottomBar() => BottomAppBar(
    height: Dimentions.height40*2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(text: "Liên hệ đặt phòng"),
            MiddleText(text: "Số điện thoại: 0123456478")
          ],
        ),
        Container(
          height: Dimentions.height50,
          width: Dimentions.width40*3,
          decoration: BoxDecoration(
              color: mainColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(Dimentions.radius10)
          ),
          child: Center(child: BigText(text: "Liên hệ", color: wColor,)),
        )
      ],
    ),
  );

  Widget buildImage(Image image, int index) => SizedBox(
    width: double.infinity,
    height: MediaQuery.of(context).size.height,
    child: hotelData.imageDetail[index],
  );
}
