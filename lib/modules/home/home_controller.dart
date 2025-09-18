import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:money_expense/domain/model/expense_w_category.dart';
import 'package:money_expense/domain/usecase/category_usecase.dart';
import 'package:money_expense/domain/usecase/expense_usecase.dart';


@injectable
class HomeController extends GetxController {

  final InitializeCategoryUsecase _initializeCategoryUsecase;
  final TotalExpenseDailyUsecase _totalExpenseDailyUsecase;
  final TotalExpenseMonthlyUsecase _totalExpenseMonthlyUsecase;
  final ExpenseByCategoryUsecase _expenseByCategoryUsecase;
  final ExpenseTodayUsecase _expenseTodayUsecase;
  final ExpenseYesterdayUsecase _expenseYesterdayUsecase;

  HomeController(
    this._initializeCategoryUsecase,
    this._totalExpenseDailyUsecase,
    this._totalExpenseMonthlyUsecase,
    this._expenseByCategoryUsecase,
    this._expenseTodayUsecase,
    this._expenseYesterdayUsecase,
  );

  final daily = RxInt(0);
  final monthly = RxInt(0);
  final dataByCategory = Rxn<ExpenseWithCategoryModel>();
  final dataToday = Rxn<ExpenseWithCategoryModel>();
  final dataYesterday = Rxn<ExpenseWithCategoryModel>();
  
  @override
  void onInit() async {
    super.onInit();

    await _initializeCategoryUsecase.execute();
  }

  void load() {

  }
}