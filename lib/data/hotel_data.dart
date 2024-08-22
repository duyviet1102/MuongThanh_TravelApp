
import 'package:flutter/material.dart';
import 'package:htx_mh/models/hotel_model.dart';
import 'package:htx_mh/resources/app_assets.dart';

import '../models/product_model.dart';

class HotelData {
  static final HotelData _instance = HotelData._internal();

  List<Image> imageDetail = [
    Image.asset(AppAssets.image1, fit: BoxFit.cover,),
    Image.asset(AppAssets.image2, fit: BoxFit.cover),
    Image.asset(AppAssets.image3, fit: BoxFit.cover),
    Image.asset(AppAssets.image4, fit: BoxFit.cover),
    Image.asset(AppAssets.image5, fit: BoxFit.cover),
    Image.asset(AppAssets.image6, fit: BoxFit.cover),
    Image.asset(AppAssets.image7, fit: BoxFit.cover),
  ];

  static List<HotelModel> getHotel(int index) {
    switch (index) {
      case 1:
        return _getHotel();
      default:
        return [];
    }
  }
  static List<HotelModel> _getHotel() {
    return [
      HotelModel(
          Colors.red,
          "HMong SitterHouse",
          "1.745.253",
          "Bản Pho, Hầu Thào, Sapa, Lào Cai",
          "introduce"
      ),
      HotelModel(
        Colors.yellowAccent,
        "Little View Sapa Homestay",
        "75.000" + "₫",
        "42 Cầu Mây, Sapa",
        "Để chuẩn bị cáng cua, người dân thường bắt cua đồng từ các dòng suối và ao trong khu vực. Cua sau đó được làm sạch, bỏ phần cứng và nướng trên lửa than ct, tiêu cũng có thể được thêm vào để tăng hương vị.Món cáng cua thường được thưởng thức cùng với rau sống như rau thơm, rau răm, bún, bánh đa, và một số loại gia vị như nước mắm chua ngọt pha chế từ các nguyên liệu tự nhiên.Cáng cua không chỉ là một món ăn ngon mà còn là một phần của văn hóa ẩm thực địa phương tại Sapa. Với hương vị đặc trưng, sự tươi ngon và độc đáo, cáng cua thu hút rấthiệm ẩm thực của vùng núi phía Bắc Việt Nam.2",
      ),
      HotelModel(
        Colors.brown,
        "Chom's HomStay",
        "85.000" + "₫",
        "Giáy, Tả Van, Sa Pa, Lào Cai",
        "Để cực. Cua sau đó được. Cua sau đó được làm sạch, bỏ phần cứng và nướng trên lửa than cho đến khi chín vàng. Một số gia vị như muối, ớt, tiêu cũng  cáng cua thường được thưởng thức cùng với rau sống như rau thơm, rau răm, bún, bánh đa, và một số loại gia vị như nước mắm chua ngọt pha chế từ các nguyên liệu tự nhiên.Cáng cua không chỉ là một món ăn ngon mà còn là một phần của văn hóa ẩm thực địa phương tại Sapa. Với hương vị đặc trưng, sự tươi ngon và độc đáo, cáng cua thu hút rất nhiều du khách đến thưởng ngoạn và trải nghiệm ẩm thực của vùng núi phía Bắc Việt Nam.3",
      ),
      HotelModel(
        Colors.purpleAccent,
        "Anh Đức Homestay Sapa",
        "65.000" + "₫",
        "Thôn Tả Van Dáy 2, Tả Van, Sapa",
        "Để chuẩn bị cáng cua, người dân thường bắt c sau đó được làm sạch, bỏ phần cứng và nướng trên lửa than cho đến khi chín vàng. Một số gia vị như muối,vị.Món cáng cua thường được thưởng thức cùng với rau sống như rau thơm, rau răm, bún, bánh đa, và một số loại gia vị như nước mắm chua ngọt pha chế từ các nguyên liệu tự nhiên.Cáng cua không chỉ là một món ăn ngon mà còn là một phần của văn hóa ẩm thực địa phương tại Sapa. Với hương vị đặc trưng, sự tươi ngon và độc đáo, cáng cua thu hút rất nhiều du khách đến thưởng ngoạn và trải nghiệm ẩm thực của vùng núi phía Bắc Việt Nam.4",
      ),
      HotelModel(
        Colors.green,
        "Hoa’s Homestay Sapa",
        "45.000" + "₫",
        "152 Thôn Bản Pho, xã Hầu Thào, Sapa",
        "Để chuẩn bị cáng cua, người dân thường bắt cua đồng từ các dòng suối và ao trong khu vực. Cua sau đó được làm sạch, bỏ phần cứng và nướng trên lửa than cho đến khi chín vàng. Một số gia vị như muối, ớt, tiêu cũng có thể được thêm vào để tăng hương vị.Món cáng cua thường được thưởng thức cùng với rau sống như rau thơm, rau răm, bún, bánh đa, và một số loại gia vị như nước mắm chua ngọt pha chế từ các nguyên liệu tự nhiên.Cáng cua không chỉ là một món ăn ngon mà còn là một phần của văn hóa ẩm thực địa phương tại Sapa. Với hương vị đặc trưng, sự tươi ngon và độc đáo, cáng cua thu hút rất nhiều du khách đến thưởng ngoạn và trải nghiệm ẩm thực của vùng núi phía Bắc Việt Nam.5",
      ),
      HotelModel(
        Colors.orange,
        "Topas Homestay Sapa",
        "25.000" + "₫",
        "Thanh Kim, Sapa",
        "Để chuẩn bị cánc. Cua sau đó được làm sạch, bỏ phần cứng và nướng trên lửa than cho đến khi chín vàng. Một số gia vị như muối, ớt, tiêu cũng có thể được thêmưởng thức cùng với rau sống như rau thơm, rau răm, bún, bánh đa, và một số loại gia vị như nước mắm chua ngọt pha chế từ các nguyên liệu tự nhiên.Cáng cua không chỉ là một món ăn ngon mà còn là một phần của văn hóa ẩm thực địa phương tại Sapa. Với hương vị đặc trưng, sự tươi ngon và độc đáo, cáng cua thu hút rất nhiều du khách đến thưởng ngoạn và trải nghiệm ẩm thực của vùng núi phía Bắc Việt Nam.6",
      ),
    ];
  }

  factory HotelData() {
    return _instance;
  }

  HotelData._internal();
}

HotelData hotelData = HotelData();
