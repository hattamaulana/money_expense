import 'package:injectable/injectable.dart';
import 'package:money_expense/data/datasource/local/dao/expense.dart';
import 'package:money_expense/data/datasource/local/database.dart';
import 'package:money_expense/domain/model/expense_w_category.dart';
import 'package:money_expense/domain/model/expense_w_total.dart';

abstract class ExpenseRepository {
  Future<int> createNewExpense(ExpenseCompanion data);

  Future<double> getTotalADay(DateTime datetime);

  Future<double> getTotalAMonth(DateTime datetime);

  Future<List<TotalEveryCategory>> getCategoryTotals();

  Future<List<ExpenseWithCategoryModel>> getBy({
    required DateTime start,
    required DateTime end,
  });
}

@LazySingleton(as: ExpenseRepository)
class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseDao _dao;

  ExpenseRepositoryImpl(this._dao);

  @override
  Future<int> createNewExpense(ExpenseCompanion data) async {
    return _dao.insert(data);
  }

  @override
  Future<List<ExpenseWithCategoryModel>> getBy({
    required DateTime start,
    required DateTime end,
  }) async {
    return await _dao.getExpenseByDate(
      start: start,
      end: end.copyWith(hour: 23, minute: 59, second: 59),
    );
  }

  @override
  Future<List<TotalEveryCategory>> getCategoryTotals() {
    return _dao.getCategoryTotals();
  }

  @override
  Future<double> getTotalADay(DateTime datetime) {
    return _dao.getTotalAmountForDay(datetime);
  }

  @override
  Future<double> getTotalAMonth(DateTime datetime) {
    return _dao.getTotalAmountForMonth(datetime);
  }
}
