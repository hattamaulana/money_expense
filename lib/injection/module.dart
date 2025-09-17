import 'package:injectable/injectable.dart';
import 'package:money_expense/data/datasource/local/dao/category.dart';
import 'package:money_expense/data/datasource/local/dao/expense.dart';
import 'package:money_expense/data/datasource/local/database.dart';

@module
abstract class Module {
  @lazySingleton
  AppDatabase get db => AppDatabase();

  @lazySingleton
  CategoryDao get categoryDao => db.categoryDao;

  @lazySingleton
  ExpenseDao get expenseDao => db.expenseDao;
}