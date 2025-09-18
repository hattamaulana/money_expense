import 'package:injectable/injectable.dart';
import 'package:money_expense/data/repositories/expense_repository.dart';
import 'package:money_expense/domain/model/expense.dart';
import 'package:money_expense/utils/enum/base_usecase.dart';


@lazySingleton
class ExpenseUsecase extends NoParamUseCase<List<ExpenseModel>> {

  final ExpenseRepository repository;

  ExpenseUsecase(this.repository);
  
  @override
  Future<List<ExpenseModel>> execute() {
    return repository.fetchAll();
  }
}