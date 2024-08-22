import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:htx_mh/models/tour_model.dart';
import 'package:htx_mh/utills/responsives/dimentions.dart';
import 'package:htx_mh/viewmodels/tour_slide_view_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../resources/colors.dart';
import '../../../utills/text/big_text.dart';
import '../../../utills/text/middle_text.dart';
import '../../../utills/text/small_text.dart';

class TourSlide extends StatefulWidget {
  const TourSlide({Key? key}) : super(key: key);

  @override
  State<TourSlide> createState() => _TourSlideState();
}
class _TourSlideState extends State<TourSlide> {

  final TourSlideViewModel _tourSlideViewModel =  TourSlideViewModel();

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(top: Dimentions.height20,),
              child: Column(
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: Dimentions.carouselOptions,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) => setState(() => activeIndex = index),
                    ),
                    itemCount: _tourSlideViewModel.tours.length,
                    itemBuilder: (BuildContext context, int index, int realIndex) {
                      final tour = _tourSlideViewModel.tours[index];
                      return buildImage(tour, index);
                    },
                  ),
                  SizedBox(height: Dimentions.height10,),
                  buildIndicator(),
                ],
              ),
            );
  }

  Widget buildImage(TourModel tourModel, int index) => Stack(
    children: [
      Container(
        height: Dimentions.height40*4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimentions.radius10),
        color: tourModel.image,
      ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.only(left: Dimentions.width15),
          height: Dimentions.height20*5,
          width: Dimentions.width230,
          margin: EdgeInsets.only(bottom: Dimentions.height10),
          decoration: BoxDecoration(
            // color: Colors.white,
              borderRadius: BorderRadius.circular(Dimentions.radius10),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFC7C8CC),
                ),
                BoxShadow(
                  color: wColor,
                  blurRadius: 3,
                  spreadRadius: -0.1,
                )
              ],
      ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Expanded(child: BigText(text: tourModel.tourName, size: Dimentions.font20,))
                ],
              ),
              Row(
                children: [
                  SizedBox(child: Icon(Icons.location_on, color: iconsColors, size: Dimentions.font20,)),
                  Expanded(child: MiddleText(text: tourModel.address, )),
                ],
              ),
              Row(
                children: [
                  SizedBox(child: Icon(Icons.star,color: iconsStarColors,size: Dimentions.font20),),
                  Expanded(child: SmallText(text: tourModel.evaluation, color: smallTextColors,)),
                  // SizedBox(width: Dimentions.width10,),
                  SizedBox(child: Icon(Icons.chat_rounded,color: iconsColors,size: Dimentions.font20),),
                  Expanded(child: SmallText(text: tourModel.comment, color: smallTextColors, ))
                ],
              )
            ],
          ),
        ),
      ),
    ],
  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: _tourSlideViewModel.tours.length,
    effect: ExpandingDotsEffect(
      activeDotColor: Colors.black,
      dotColor: Colors.grey,
      dotHeight: Dimentions.height8,
      dotWidth: Dimentions.width10,
    ),
  );
}
