import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:htx_mh/viewmodels/constants/constant.dart';

import '../../models/tour_model.dart';

  Future<List<TourModel>> getTour() async {
    var url = Uri.parse('${Url}tour'); // Địa chỉ API của tour

    var response = await http.get(
      url,
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Phân tích dữ liệu JSON nhận được từ server
      List<dynamic> data = json.decode(response.body);

      // Chuyển đổi dữ liệu JSON thành danh sách các tour
      List<TourModel> tours = data.map((item) => TourModel.fromJson(item)).toList();

      return tours;
    } else {
      // Nếu có lỗi, in ra thông báo lỗi
      debugPrint('Error: ${response.statusCode}');
      return []; // Trả về một danh sách rỗng
  }
}
