import 'package:injectable/injectable.dart';
import 'package:money_expense/data/datasource/local/database.dart';
import 'package:money_expense/data/repositories/expense_repository.dart';
import 'package:money_expense/domain/model/expense_w_category.dart';
import 'package:money_expense/domain/model/expense_w_total.dart';
import 'package:money_expense/utils/enum/base_usecase.dart';



@lazySingleton
class CreateNewExpenseUsecase extends ParamUseCase<int, ExpenseCompanion> {

  final ExpenseRepository expenseRepository;

  CreateNewExpenseUsecase(
    this.expenseRepository,
  );
  
  @override
  Future<int> execute(ExpenseCompanion params) async {
    return expenseRepository.createNewExpense(params);
  }
}



@lazySingleton
class TotalExpenseDailyUsecase extends NoParamUseCase<double> {

  final ExpenseRepository repository;

  TotalExpenseDailyUsecase(this.repository);
  
  @override
  Future<double> execute() {
    return repository.getTotalADay(DateTime.now());
  }
}



@lazySingleton
class TotalExpenseMonthlyUsecase extends NoParamUseCase<double> {

  final ExpenseRepository repository;

  TotalExpenseMonthlyUsecase(this.repository);
  
  @override
  Future<double> execute() {
    return repository.getTotalAMonth(DateTime.now());
  }
}



@lazySingleton
class ExpenseByCategoryUsecase extends NoParamUseCase<List<TotalEveryCategory>> {

  final ExpenseRepository repository;

  ExpenseByCategoryUsecase(this.repository);
  
  @override
  Future<List<TotalEveryCategory>> execute() {
    return repository.getCategoryTotals();
  }
}



@lazySingleton
class ExpenseTodayUsecase extends NoParamUseCase<List<ExpenseWithCategoryModel>> {

  final ExpenseRepository repository;

  ExpenseTodayUsecase(this.repository);
  
  @override
  Future<List<ExpenseWithCategoryModel>> execute() {
    final datetime = DateTime.now();

    return repository.getBy(
      start: datetime,
      end: datetime
    );
  }
}



@lazySingleton
class ExpenseYesterdayUsecase extends NoParamUseCase<List<ExpenseWithCategoryModel>> {

  final ExpenseRepository repository;

  ExpenseYesterdayUsecase(this.repository);
  
  @override
  Future<List<ExpenseWithCategoryModel>> execute() {
    final datetime = DateTime.now().subtract(const Duration(days: 1));

    return repository.getBy(
      start: datetime, 
      end: datetime
    );
  }
}