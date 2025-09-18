import 'package:money_expense/domain/model/category.dart';

class TotalEveryCategory {
  final CategoryModel category;
  final double totalAmount;

  TotalEveryCategory({
    required this.category,
    required this.totalAmount,
  });
}