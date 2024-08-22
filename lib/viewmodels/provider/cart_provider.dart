
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier{
  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  void _setPreItem() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }
  void _getPreItem() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item') ?? 0;
    _totalPrice = prefs.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }
  void addTotalPrice(double productPrice){
    _totalPrice = _totalPrice + productPrice;
    _setPreItem();
    notifyListeners();
  }
  void removeTotalPrice(double productPrice){
    _totalPrice = _totalPrice - productPrice;
    _setPreItem();
    notifyListeners();
  }
  double getTotalPrice(){
    _getPreItem();
    return _totalPrice;
  }

  void addCounter(){
    _counter ++;
    _setPreItem();
    notifyListeners();
  }
  void removeCounter(){
    _counter --;
    _setPreItem();
    notifyListeners();
  }
  int getCounter(){
    _getPreItem();
    return _counter;
  }
}