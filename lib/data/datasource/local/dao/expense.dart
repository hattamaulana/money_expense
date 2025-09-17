import 'package:drift/drift.dart';
import 'package:money_expense/data/datasource/local/database.dart';

part 'expense.g.dart';

@DriftAccessor(tables: [Expense])
class ExpenseDao extends DatabaseAccessor<AppDatabase> with _$ExpenseDaoMixin {
  ExpenseDao(AppDatabase db) : super(db);
}