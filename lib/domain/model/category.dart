import 'package:flutter/material.dart';

class CategoryModel {
  String? name;
  String? icon;
  int? color;

  CategoryModel({
    this.name, 
    this.icon,
    this.color, 
  });
}

extension GetIcon on CategoryModel {
  IconData getIcon() {
    return Icons.add_ic_call_outlined;
  }

  Color getColor() {
    return Color(0);
  }
}