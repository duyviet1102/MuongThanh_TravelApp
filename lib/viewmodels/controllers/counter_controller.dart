import 'package:flutter/material.dart';

class DataModel extends ChangeNotifier {
  int roomCount = 1;
  int personCount = 1;

  // Cập nhật số lượng phòng
  void incrementRoom() {
    roomCount++;
    notifyListeners();
  }

  void decrementRoom() {
    if (roomCount > 1) {
      roomCount--;
      notifyListeners();
    }
  }

  // Cập nhật số lượng người
  void incrementPerson() {
    personCount++;
    notifyListeners();
  }

  void decrementPerson() {
    if (personCount > 1) {
      personCount--;
      notifyListeners();
    }
  }
}