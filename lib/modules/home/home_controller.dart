import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:money_expense/domain/model/expense_w_category.dart';
import 'package:money_expense/domain/model/expense_w_total.dart';
import 'package:money_expense/domain/usecase/category_usecase.dart';
import 'package:money_expense/domain/usecase/expense_usecase.dart';
import 'package:money_expense/routes/app_pages.dart';


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

  final daily = RxDouble(0);
  final monthly = RxDouble(0);
  final dataByCategory = Rxn<List<TotalEveryCategory>>();
  final dataToday = Rxn<List<ExpenseWithCategoryModel>>();
  final dataYesterday = Rxn<List<ExpenseWithCategoryModel>>();
  
  @override
  void onInit() async {
    super.onInit();

    await _initializeCategoryUsecase.execute();
    load();
  }

  void load() async {
    daily(await _totalExpenseDailyUsecase.execute());
    monthly(await _totalExpenseMonthlyUsecase.execute());
    dataByCategory(await _expenseByCategoryUsecase.execute());
    dataToday(await _expenseTodayUsecase.execute());
    dataYesterday(await _expenseYesterdayUsecase.execute());
  }

  void navigateToAddExpense() async {
    final res = await Get.toNamed(Routes.EXPENSE_ADD);

    if (res != null) {
      load();
    }
  }
}