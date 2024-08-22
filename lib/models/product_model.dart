import 'dart:io';
import 'package:flutter/material.dart';

class ProductModel {
  final Image image;
  final String name;
  final int price;
  final String category;
  final String description;

  ProductModel(this.image, this.name, this.price, this.category, this.description);
}

