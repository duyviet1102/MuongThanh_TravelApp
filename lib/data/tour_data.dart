import 'package:flutter/material.dart';
import 'package:htx_mh/models/hotel_model.dart';
import 'package:htx_mh/resources/app_assets.dart';

import '../models/product_model.dart';
import '../models/tour_model.dart';

class TourData {
  static final TourData _instance = TourData._internal();

  List<Image> imageDetail = [
    Image.asset(
      AppAssets.image1,
      fit: BoxFit.cover,
    ),
    Image.asset(AppAssets.image2, fit: BoxFit.cover),
    Image.asset(AppAssets.image3, fit: BoxFit.cover),
    Image.asset(AppAssets.image4, fit: BoxFit.cover),
    Image.asset(AppAssets.image5, fit: BoxFit.cover),
    Image.asset(AppAssets.image6, fit: BoxFit.cover),
    Image.asset(AppAssets.image7, fit: BoxFit.cover),
  ];

  static List<TourModel> getHotel(int index) {
    switch (index) {
      case 1:
        return _getTour();
      default:
        return [];
    }
  }

  static List<TourModel> _getTour() {
    return [
      TourModel(
        image: Colors.red,
        tourName: "Tour 2 ngày 1 đêm",
        address: "Địa chỉ A",
        evaluation: "4.5",
        comment: "1450",
      ),
      TourModel(
        image: Colors.blue,
        tourName: "Tour A",
        address: "Địa chỉ B",
        evaluation: "4.0",
        comment: "1200",
      ),
      TourModel(
        image: Colors.yellowAccent,
        tourName: "Tour B",
        address: "Địa chỉ C",
        evaluation: "4.8",
        comment: "1800",
      ),
      TourModel(
        image: Colors.green,
        tourName: "Tour C",
        address: "Địa chỉ D",
        evaluation: "4.2",
        comment: "950",
      ),
      TourModel(
        image: Colors.purpleAccent,
        tourName: "Tour D",
        address: "Địa chỉ E",
        evaluation: "4.7",
        comment: "2000",
      ),
    ];
  }

  factory TourData() {
    return _instance;
  }

  TourData._internal();
}

TourData hotelData = TourData();
