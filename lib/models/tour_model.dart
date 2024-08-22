import 'dart:ui';

class TourModel {
  final Color image;
  final String tourName;
  final String address;
  final String evaluation;
  final String comment;

  TourModel({
    required this.image,
    required this.tourName,
    required this.address,
    required this.evaluation,
    required this.comment,
  });

  factory TourModel.fromJson(Map<String, dynamic> json) {
    return TourModel(
      tourName: json['tourName'],
      comment: json['comment'],
      evaluation: json['evaluation'],
      address: json['address'],
      image: json['image'],
    );
  }

}
