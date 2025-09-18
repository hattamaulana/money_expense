import 'package:injectable/injectable.dart';
import 'package:money_expense/domain/model/expense.dart';

abstract class ExpenseRepository {
  Future<bool> recordExpense({
    required String name,
    required int categoryId,
    required int amount,
    required DateTime datetime,
  });

  Future<List<ExpenseModel>> fetchAll();
}

@LazySingleton(as: ExpenseRepository)
class ExpenseRepositoryImpl implements ExpenseRepository {
  
  @override
  Future<bool> recordExpense({
    required String name,
    required int categoryId,
    required int amount,
    required DateTime datetime,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<ExpenseModel>> fetchAll() {
    return Future.value([
      ExpenseModel(),
    ]);
  }
}