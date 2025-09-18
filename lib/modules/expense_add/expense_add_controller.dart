import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:money_expense/domain/usecase/category_usecase.dart';
import 'package:money_expense/domain/usecase/expense_usecase.dart';

@injectable
class ExpenseAddController extends GetxController {

  final RetriveCategoryUsecase _retriveCategoryUsecase;
  final CreateNewExpenseUsecase _createNewExpenseUsecase;

  ExpenseAddController(
    this._retriveCategoryUsecase,
    this._createNewExpenseUsecase,
  );
}