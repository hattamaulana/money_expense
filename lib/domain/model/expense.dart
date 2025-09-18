import 'package:money_expense/domain/model/category.dart';

class ExpenseModel {
  DateTime? datetime;
  String? name;
  int? amount;
  CategoryModel? category;

  ExpenseModel({
    this.datetime,
    this.name,
    this.amount,
    this.category,
  });
}