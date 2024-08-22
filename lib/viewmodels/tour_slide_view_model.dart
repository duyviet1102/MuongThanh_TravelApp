import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/tour_model.dart';

class TourSlideViewModel {
  final List<TourModel> tours = [
    TourModel(
      image: Colors.red,
      tourName: "Tour 2 ngày 1 đêm",
      address: "Tả Van",
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
  // final RxList tours = [].obs; // Sử dụng RxList để quản lý danh sách các tour
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //   getTour(); // Gọi phương thức fetchTours khi controller được khởi tạo
  // }
  //
  // Future<void> getTour() async {
  //   try {
  //     var url = Uri.parse('${Url}tour'); // Địa chỉ API của tour
  //
  //     var response = await http.get(url, headers: {'Accept': 'application/json'},
  //     );
  //     if (response.statusCode == 200) {
  //       // Nếu lấy dữ liệu thành công, phân tích dữ liệu JSON và cập nhật danh sách tours
  //       var jsonData = response.body;
  //       List<dynamic> data = json.decode(jsonData);
  //       tours.assignAll(data.map((tourJson) => Tour.fromJson(tourJson)).toList());
  //       print('Successfully fetched ${tours.length} tours');
  //     } else {
  //       // Nếu không thành công, in ra lỗi
  //       print('Failed to load tours: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     // Nếu có lỗi xảy ra trong quá trình gọi API, in ra lỗi
  //     print('Error fetching tours: $e');
  //   }
  // }
}
