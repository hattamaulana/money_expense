import 'package:flutter/material.dart';

class CategoryModel {
  int? id;
  final String name;
  final String icon;
  final int color;

  CategoryModel({
    this.id,
    required this.name, 
    required this.icon,
    required this.color, 
  });
}

extension GetIcon on CategoryModel {
  String getIcon() {
    return "assets/icons/$icon.svg";
  }

  Color getColor() {
    return Color(color);
  }
}