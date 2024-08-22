
import 'dart:ui';

class HotelModel{

  final Color image;
  final String hotelName;
  final String price;
  final String address;
  final String introduce;

  HotelModel(
  this.image,
  this.hotelName,
  this.price,
  this.address,
  this.introduce);


  // factory ProductModel.fromJson(Map<String, dynamic> json) {
  //   return ProductModel(
  //     image: json['tourName'],
  //     productName: json['comment'],
  //     price: json['evaluation'],
  //     brand: json['address'],
  //     introduce: json['image'],
  //   );
  // }


}