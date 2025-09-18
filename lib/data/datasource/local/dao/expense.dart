import 'package:drift/drift.dart';
import 'package:money_expense/data/datasource/local/database.dart';
import 'package:money_expense/domain/model/category.dart';
import 'package:money_expense/domain/model/expense.dart';
import 'package:money_expense/domain/model/expense_w_category.dart';
import 'package:money_expense/domain/model/expense_w_total.dart';

part 'expense.g.dart';

@DriftAccessor(tables: [Expense, Category])
class ExpenseDao extends DatabaseAccessor<AppDatabase> with _$ExpenseDaoMixin {
  ExpenseDao(super.db);

  Future<int> insert(ExpenseCompanion data) => into(expense).insert(data);

  /// Gets the sum amounts for a specific day.
  Future<double> getTotalAmountForDay(DateTime date) async {
    final start = DateTime.now().copyWith(hour: 0, minute: 0, second: 0);
    final end = DateTime.now().copyWith(hour: 23, minute: 59, second: 59);
    final amountSum = expense.amount.sum();
    final query = selectOnly(expense)
      ..addColumns([amountSum])
      ..where(expense.datetime.isBetween(Constant(start), Constant(end)));

    return await query.map((row) => row.read(amountSum)).getSingle() ?? 0.0;
  }

  /// Gets the sum amounts for a specific month.
  Future<double> getTotalAmountForMonth(DateTime date) async {
    final amountSum = expense.amount.sum();

    final query = selectOnly(expense)
      ..addColumns([amountSum])
      ..where(expense.datetime.year.equals(date.year))
      ..where(expense.datetime.month.equals(date.month));

    return await query.map((row) => row.read(amountSum)).getSingle() ?? 0.0;
  }

  /// Gets the sum amounts for each category.
  Future<List<TotalEveryCategory>> getCategoryTotals() async {
    final totalAmount = expense.amount.sum();
    final query = select(category).join([
      leftOuterJoin(expense, expense.categoryId.equalsExp(category.id))
    ]);
    
    query.addColumns([totalAmount]);
    query.groupBy([category.id]);

    final result = await query.get();

    return result.map((row) {
      final categoryEntity = row.readTable(category);
      final total = row.read(totalAmount) ?? 0.0;

      return TotalEveryCategory(
        category: CategoryModel(
          id: categoryEntity.id,
          name: categoryEntity.name,
          icon: categoryEntity.icon,
          color: categoryEntity.color,
        ),
        totalAmount: total,
      );
    }).toList();
  }

  /// Gets all expense that occurred today.
  Future<List<ExpenseWithCategoryModel>> getExpenseByDate({
    required DateTime start,
    required DateTime end,
  }) {
    final query = select(expense).join([
      innerJoin(category, category.id.equalsExp(expense.categoryId)),
    ])..where(expense.datetime.isBetween(Constant(start), Constant(end)));

    return query.get().then((rows) {
      // Mapping logic is the same as above
      return rows.map((row) {
        final resultExpense = row.readTable(expense);
        final resultCategory = row.readTable(category);

        return ExpenseWithCategoryModel(
          expense: ExpenseModel(
            datetime: resultExpense.datetime,
            name: resultExpense.name,
            amount: resultExpense.amount,
          ),
          category: CategoryModel(
            id: resultCategory.id,
            name: resultCategory.name,
            icon: resultCategory.icon,
            color: resultCategory.color,
          ),
        );
      }).toList();
    });
  }
}
