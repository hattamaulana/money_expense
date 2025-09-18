import 'package:money_expense/domain/model/category.dart';
import 'package:money_expense/domain/model/expense.dart';

class ExpenseWithCategoryModel {
  final ExpenseModel expense;
  final CategoryModel category;

  ExpenseWithCategoryModel({
    required this.expense,
    required this.category,
  });
}